class NovabulletinsController < ApplicationController
	before_action(:authenticate_user!)
	def index
		@bulletins = NovaBulletin.all
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
		bulletin = NovaBulletin.find_by_id(params[:bulletin_id])
		if User.find_by_id(params[:user_id]).role = "admin"
			bulletin.delete
		end
		redirect_to(:back)
	end
	def edit
		@bulletin = NovaBulletin.find_by_id(params[:bulletin_id])
		render('edit')
	end
	def update
		bulletin = NovaBulletin.find_by_id(params[:bulletin_id])
		if User.find_by_id(params[:user_id]).role = "admin"
			bulletin.update(novabulletin_params)
		end
		redirect_to('/nova')
	end
	def novabulletin_params
		params.permit(:title, :content)
	end
end
