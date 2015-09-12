class SiteController < ApplicationController
	before_action(:check_for_user)
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
	def check_for_user
		if current_user.present?
			redirect_to("/notes")
		end
	end
end
