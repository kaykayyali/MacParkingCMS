class StaffingController < ApplicationController
	before_action(:authenticate_user!)
	before_action(:check_Admin)
	def create_booking
		
	end
	def remove_booking
		
	end

	def show
		@event = Event.find(params[:event_id])
		@employees = Employee.all
		render('show')
	end
	def check_Admin
		if current_user.role != "admin"
			redirect_to('/')
		end
	end
	
end
