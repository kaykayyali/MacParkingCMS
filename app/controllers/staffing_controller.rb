class StaffingController < ApplicationController
	before_action(:authenticate_user!)
	before_action(:check_Admin)
	def create_booking
		newBooking = Booking.new()
		newBooking.booking_type_id = BookingType.where(name: params[:type].capitalize).limit(1)[0].id
		newBooking.event_id = params[:event_id]
		newBooking.employee_id = params[:employee_id]
		if newBooking.save
			flash[:notice] = "Successfully staffed " + Employee.find(params[:employee_id]).name + " for " + Event.find(params[:event_id]).event_name
			respond_to do |format|
			  format.json { render json: {:status => 200} }
			end
		else 
			print("FAILED TO SAVE NEW BOOKING")
		end
	end
	def delete_booking
		Booking.find(params[:booking_id]).delete
		redirect_to(:back)
	end
	def show
		if flash.notice
			@notice = flash.notice
			p(@notice)
		elsif flash.alert
			@alert = flash.alert
			p(@alert)
		end
		print "FLASH MESSAGE"
		p flash.notice
		@event = Event.find(params[:event_id])
		@employees = Employee.all.select {|employee| !employee.events.include?(@event) }
		@bookings = Booking.where(event_id: @event.id)
		doormen = @bookings.select do |elem|
			elem.booking_type.name ==  "Doorman"
		end
		runners = @bookings.select do |elem|
			elem.booking_type.name  ==  "Runner"
		end
		lotmen = @bookings.select do |elem|
			elem.booking_type.name == "Lotman"
		end
		shuttles = @bookings.select do |elem|
			elem.booking_type.name ==  "Shuttle"
		end
		@types = ["doormen", "runners", "lotmen", "shuttles"]
		@data_hash = {
			:doormen => doormen,
			:runners => runners,
			:lotmen => lotmen,
			:shuttles => shuttles,
		}
		render('show')
	end
	def confirm_crew
		@event = Event.find_by(id: params[:event_id])
		if @event.confirmed == true
			render json: { status: 200, event: "Event was already confirmed"}
			return
		end
		@bookings = Booking.where(event_id: @event.id)
		@bookings.each do |booking|
			if booking.employee
				if booking.employee.phone != nil && Phonelib.valid?(booking.employee.phone)
					p "Attempting to message " + booking.employee.name + " about event " + @event.id.to_s
					Twilio_Client.account.messages.create({
						:from => ENV['TWILIO_NUMBER'], 
						:to => booking.employee.phone.to_s, 
						:body => "You have been scheduled for a new event, view it at http://www.macparking.co/events/show_employee/" + @event.id.to_s ,  
					})
				else
					p "No number for employee " + booking.employee.to_s
				end
			else
				p "No employee for booking " + booking.id.to_s
			end
		end
		@event.update(confirmed: true)
		render json: { status: 200, event: "Confirmed employees"}
	end
	def check_profile 
		flash[:notice] = "You must create a profile to see this"
		if !current_user.profile 
			redirect_to(new_employee_path)
		end
	end
	def check_Admin
		if current_user.role != "admin"
			redirect_to('/')
		end
	end

end
