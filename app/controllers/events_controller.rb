class EventsController < ApplicationController
	before_action(:authenticate_user!)
	before_action(:check_Admin)
	def index
		if flash.notice
			@notice = flash.notice
			p(@notice)
		elsif flash.alert
			@alert = flash.alert
			p(@alert)
		end
		@events = Event.all
		render('index')
	end
	def show
		@event = Event.find(params[:id])
		render('show')
	end

	def new
		render('new')
	end

	def create
		event_info = event_params
		event = Event.new()
		event.event_name = event_info[:event_name]
		event.date = event_info[:date]
		event.start_time = event_info[:start_time]
		event.end_time = event_info[:end_time]
		event.guest_count = event_info[:guest_count]
		event.contact_name = event_info[:contact_name]
		event.contact_number = event_info[:contact_number]
		event.street_address = event_info[:street_address]
		event.zipcode = event_info[:zipcode]
		event.city = event_info[:city]
		event.state = event_info[:state]
		event.price = event_info[:price]
		event.paid = event_info[:paid]
		event.notes = event_info[:notes]
		if event.save 
			flash[:notice] = "Successfully created event"
			redirect_to('/events')
		end
	end

	def update
		@event = Event.find(params[:id])
		render('update')
	end
	def update_model
		event_info = event_params
		event = Event.find(params[:id])
		event.event_name = event_info[:event_name]
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
		event.notes = event_info[:notes]
		if event.save 
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
				event_feed_object.push(new_feed_item)
				p event_feed_object
			end
			p "EVENT FEED"
			p event_feed_object
		  format.json { render :json => event_feed_object.to_json }
		end
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
	private
	def event_params
		params.permit(:event_name,:event_type, :date, :start_time, :end_time, :guest_count, :contact_name, :contact_number, :street_address, :zipcode, :city, :state, :price, :paid, :notes)
	end
end
