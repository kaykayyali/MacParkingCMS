class EmployeesController < ApplicationController
	before_action(:authenticate_user!)
	before_action(:check_profile)
	before_action(:check_Admin)
	skip_before_action :check_Admin, only: [:create, :new, :update, :make_admin, :update_model]
	skip_before_action :check_profile, only: [:create, :new]
	def index
		if flash.notice
			@notice = flash.notice
			p(@notice)
		elsif flash.alert
			@alert = flash.alert
			p(@alert)
		end
		@employees = Employee.all
		render('index')
	end
	def make_admin
		user = User.find(current_user.id)
		user.role = "admin"
		if user.save 
			flash[:notice] = "Successfully made into an admin"
			redirect_to('/')
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
		@employee = Employee.find(params[:id])
		render('show')
	end

	def new
		render('new')
	end

	def create
		employee_info = employee_params
		newEmployee = Employee.new()
		newEmployee.name = employee_info[:name]
		newEmployee.email = employee_info[:email]
		newEmployee.phone = employee_info[:phone]
		if newEmployee.save 
			newProfile = Profile.new
			newProfile.user = current_user
			newProfile.employee = newEmployee
			newProfile.save
			flash[:notice] = "Successfully created your profile."
			if newEmployee.phone != nil || newEmployee.phone != ""
				Twilio_Client.account.messages.create({
					:from => '+12607880786', 
					:to => newEmployee.phone.to_s, 
					:body => "Thank you for signing up with Mac Parking Online",  
				})
			end
			redirect_to('/employees')
		end
	end

	def update
		@employee = Employee.find(params[:id])
		render('update')
	end
	def update_model
		employee_info = employee_params
		employee = Employee.find(params[:id])
		employee.name = employee_info[:name]
		employee.email = employee_info[:email]
		employee.phone = employee_info[:phone]
		if employee.save 
			flash[:notice] = "Successfully updated Employee " + employee.name
			redirect_to('/employees')
		end
	end

	def delete
		employee = Employee.find(params[:id])
		employee.delete
		redirect_to('/employees')
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
	def employee_params
		params.permit(:name, :email, :phone)
	end
end
