class NovaController < ApplicationController
	before_action(:authenticate_user!)
	def index
		@bulletin = NovaBulletin.last
		if User.find_by_id(@bulletin.created_by.to_i).methods.include?(:first_name)
			@bulletin.created_by = User.find_by_id(@bulletin.created_by.to_i).first_name
		else
			@bulletin.created_by = nil
		end
		render('index')
	end
end
