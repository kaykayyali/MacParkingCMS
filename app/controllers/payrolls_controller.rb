class PayrollsController < ApplicationController
	before_action(:authenticate_user!)
	before_action(:check_Admin)
	def index
		render('index')
	end
	def new
		render('new')
	end

	def check_Admin
		if current_user.role != "admin"
			redirect_to('/')
		end
	end
end
 