class SiteController < ApplicationController
	
	def index
		render 'index'
	end

	def subscribe
		Subscription.create(email: params[:email])
		render status: 200, json: {response: "Worked"}
	end

	def contact_us
		ContactMessage.create(name: params[:name], email: params[:email], phone: params[:phone],content: params[:content])
		render status: 200, json: {response: "Worked"}
	end
	
end
