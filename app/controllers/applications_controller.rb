class ApplicationsController < ApplicationController
	before_action(:authenticate_user!)
	def index
		if current_user.role == "admin"
			@applications = Application.all
			render('index')
		else
			render("unauthorized")
		end
	end
	def show
		@application = Application.find_by_id(params[:app_id])
		render("show")
	end
end
