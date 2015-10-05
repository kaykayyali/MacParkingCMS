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
	def employment
		render("new_app")
	end

	def newapp
		new_app = Application.create(app_params)
		render 'index'
	end


	def check_for_user
		if current_user.present?
			redirect_to("/#{current_user.id}/home")
		end
	end
	def app_params
		params.permit(:first_name, :last_name, :phone, :street_address, :has_car, :email)
	end
end
