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
		# @employees.each do |employee| 
		# 	if employee.events.include?(@event)
		# 		@employees.to_arr.pop(employee)
		# 		p "FOUND EVENT"
		# 	end
		# end
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
