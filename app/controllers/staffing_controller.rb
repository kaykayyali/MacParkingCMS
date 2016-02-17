class StaffingController < ApplicationController
	before_action(:authenticate_user!)
	before_action(:check_Admin)
	def create_booking
		newBooking = Booking.new()
		newBooking.booking_type = params[:type]
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
	def remove_booking
		respond_to do |format|
		  format.json { render json: {:status => 200} }
		end	
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
		@employees = Employee.all
		@bookings = Booking.where(event_id: @event.id)
		doormen = @bookings.select do |elem|
			elem.booking_type ==  "doorman"
		end
		runners = @bookings.select do |elem|
			elem.booking_type ==  "runner"
		end
		lotmen = @bookings.select do |elem|
			elem.booking_type == "lotman"
		end
		shuttles = @bookings.select do |elem|
			elem.booking_type ==  "shuttle"
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
	def check_Admin
		if current_user.role != "admin"
			redirect_to('/')
		end
	end

end
