class NbcommentsController < ApplicationController
	before_action(:authenticate_user!)
	def new
		newcomment = Nbcomment.new
		newcomment.content = params[:content]
		newcomment.user_id = current_user.id
		newcomment.nova_bulletin_id = params[:bulletin_id]
		newcomment.save 
		redirect_to('/nova')
	end
	def delete
		Nbcomment.find_by_id(params[:comment_id])
		redirect_to('/nova')
	end
	def nbcomments_params
		params.permit(:content)
	end
end
