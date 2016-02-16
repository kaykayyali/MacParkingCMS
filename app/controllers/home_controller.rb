class HomeController < ApplicationController
	before_action(:authenticate_user!)
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
end
