class HomeController < ApplicationController
	before_action(:authenticate_user!)
	before_action(:check_profile)
	before_action(:check_Admin)
	skip_before_action :check_Admin, only: [:my_schedule]
	def index
		if flash.notice
			@notice = flash.notice
			p(@notice)
		elsif flash.alert
			@alert = flash.alert
			p(@alert)
		end
		if params[:newLogin] == "true"
			@freshLogin = true
		end
		render('index')
	end
	def my_schedule
		render('my_schedule')
	end
	def check_profile 
		if !current_user.profile 
			flash[:notice] = "Please create a profile"
			redirect_to(new_employee_path)
		end
	end
	def check_Admin
		if current_user.role != "admin"
			redirect_to('/my_schedule')
		end
	end
end
