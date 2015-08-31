class InvoicesController < ApplicationController
	def show
		@invoice = Invoice.find_by_id(params[:id])
		render 'show'
	end
end
