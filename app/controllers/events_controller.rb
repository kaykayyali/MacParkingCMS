class EventsController < ApplicationController
	before_action(:authenticate_user!)
	# before_action(:check_profile)
	# before_action(:check_Admin)
	skip_before_action :check_Admin, only: [:generate_my_event_feed, :show_employee]
	def index
		if flash.notice
			@notice = flash.notice
			p(@notice)
		elsif flash.alert
			@alert = flash.alert
			p(@alert)
		end
		@month = Date.today.strftime("%B") + " " + Date.today.year.to_s
		@events = Event.where('extract(month from date) = ?', Date.today.month)
		render('index')
	end
	def index_by_month
		if flash.notice
			@notice = flash.notice
			p(@notice)
		elsif flash.alert
			@alert = flash.alert
			p(@alert)
		end
		@month = Date::MONTHNAMES[params[:month].to_i] + " " + Date.today.year.to_s
		@events = Event.where('extract(month from date) = ?', params[:month])
		render('index')
	end
	def index_unpaid
		@month = ""
		@events = Event.where('paid = false')
		render('index_unpaid')
	end
	def index_unpaid_by_month
		@month = "for " + Date::MONTHNAMES[params[:month].to_i] + " " + Date.today.year.to_s
		@events = Event.where('paid = false and extract(month from date) = ?', params[:month])
		render('index_unpaid')
	end
	def show
		@event = Event.find(params[:id])
		render('show')
	end

	def new
		@event = Event.new()
		@event.date = Date.today()
		render('new')
	end
	def new_with_date
		@date = params[:date]
		@event = Event.new()
		@event.date = params[:date]
		render('new')
	end
	def create
		event_info = event_params
		event = Event.new(event_params)
		if event_params[:paid] == "on"
			event.paid = true
		else 
			event.paid = false
		end
		p "PAID!!"

		p event_params
		if event.save 
			flash[:notice] = "Successfully created event"
			redirect_to('/events')
		end
	end

	def edit
		@event = Event.find_by_id(params[:id])
		p @event
	end
	def update_model
		event_info = event_params
		event = Event.find(params[:id])
		event.event_name = event_info[:event_name]
		event.excelfile = event_info[:excelfile]
		event.date = event_info[:date]
		event.start_time = event_info[:start_time]
		event.end_time = event_info[:end_time]
		event.event_type = event_info[:event_type]
		event.guest_count = event_info[:guest_count]
		event.contact_name = event_info[:contact_name]
		event.contact_number = event_info[:contact_number]
		event.street_address = event_info[:street_address]
		event.zipcode = event_info[:zipcode]
		event.city = event_info[:city]
		event.state = event_info[:state]
		event.price = event_info[:price]
		event.paid = event_info[:paid]
		if event_params[:paid] = "on"
			event.paid = true
		else 
			event.paid = false
		end
		event.notes = event_info[:notes]
		if event.update(event_params) 
			flash[:notice] = "Successfully updated event " + event.event_name
			redirect_to('/events')
		end
	end

	def delete
		event = Event.find(params[:id])
		event.delete
		redirect_to('/events')
	end
	def generate_feed
		respond_to do |format|
			events = Event.all
			event_feed_object = []
			events.each do |event| 
				new_feed_item = {}
				new_feed_item[:title] = event.event_name
				new_feed_item[:start] = event.date
				new_feed_item[:id] = event.id
				p new_feed_item
				if new_feed_item[:start] 
					event_feed_object.push(new_feed_item)
				end
			end
			p "EVENT FEED"
			p event_feed_object
		  format.json { render :json => event_feed_object.to_json }
		end
	end
	def generate_my_event_feed
		events = []
			events_collection = Event.all
			events_collection.each do |event| 
				event.bookings.each do |booking|
					p booking
					if booking.employee == current_user.profile.employee
						events.append(event)
					end
				end
			end
			p events
			event_feed_object = []
			events.each do |event| 
				new_feed_item = {}
				new_feed_item[:title] = event.event_name
				new_feed_item[:start] = event.date
				new_feed_item[:id] = event.id
				p new_feed_item
				if new_feed_item[:start] 
					event_feed_object.push(new_feed_item)
				end
			end
			p "EVENT FEED"
			p event_feed_object
		respond_to do |format|
		  format.json { render :json => event_feed_object.to_json }
		end
	end
	def show_employee
		@event = Event.find(params[:event_id])
		render('show_employee')
	end
	# This Could be used to generate a small partial
	# def mini_view
	# 	render('mini_view')
	# end

	def check_Admin
		if current_user.role != "admin"
			redirect_to('/')
		end
	end
		def check_profile 
		if !current_user.profile 
			flash[:alert] = "You must create a profile to see this"
			redirect_to(new_employee_path)
		end
	end
	private
	def event_params
		p params
		params.require(:event).permit(:event_name, :event_type, :excelfile, :date, :start_time, :end_time, :guest_count, :contact_name, :contact_number, :street_address, :zipcode, :city, :state, :price, :paid, :notes)
	end
end
