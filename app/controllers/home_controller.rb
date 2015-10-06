class HomeController < ApplicationController
	before_action(:authenticate_user!)
	def index
		if params[:newLogin] == "true"
			@freshLogin = true
		end
		render('index')
	end
end
