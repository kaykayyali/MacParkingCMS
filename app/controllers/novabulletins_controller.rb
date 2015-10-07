class NovabulletinsController < ApplicationController
	before_action(:authenticate_user!)
	def index
		render('index')
	end
	def show
		render('show')
	end
	def new
		render('new')
	end
	def create
		newBulletin = NovaBulletin.new
		newBulletin.created_by = current_user.id
		newBulletin.title = params[:title]
		newBulletin.content = params[:content]
		if newBulletin.save
			redirect_to(nova_home_path)
		else
			redirect_to(new_nova_bulletin_path)
		end
	end
	def delete
		
	end
	def edit
		render('edit')
	end
	def update
		
	end
	def novabulletin_params
		params.permit(:title, :content)
	end
end
