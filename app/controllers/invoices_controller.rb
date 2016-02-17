class InvoicesController < ApplicationController
	before_action(:authenticate_user!)
	before_action(:check_Admin)
	def show
		@invoice = Invoice.find_by_id(params[:id])
		render 'show'
	end
end
