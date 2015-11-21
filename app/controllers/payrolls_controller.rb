class PayrollsController < ApplicationController
	before_action(:authenticate_user!)
	before_action(:check_Admin)
	def index
		@payrolls = Payrollentry.all.reverse
		render('index')
	end
	def new
		render('new')
	end
	def edit
		@items = Payrollentry.find_by_id(params[:id]).payrollitems
		p @items
		render('edit')
	end
	def create
		new_payroll_entry = Payrollentry.new 
	    new_payroll_entry.week_start_date = nil
	    new_payroll_entry.week_end_date = nil
	    new_payroll_entry.submission_date = Date.today
	    new_payroll_entry.gross_total = 0
	    new_payroll_entry.net_total = 0
	    new_payroll_entry.user_id = current_user.id
	    p new_payroll_entry
	    new_payroll_entry.save

		params[:payroll_data].each do |item|
			# Setup payroll_items and set attributes
			new_payroll_item = Payrollitem.new()
			new_payroll_item.name_of_employee = item[1][:name]
			new_payroll_item.net_pay = item[1][:net]
			new_payroll_item.gross_pay = item[1][:gross]
			new_payroll_item.medicare_tax = item[1][:medicare]
			new_payroll_item.employers_tax = item[1][:employers]
			new_payroll_item.payrollentry_id = new_payroll_entry.id
			# Add to gross total
			new_payroll_entry.gross_total = new_payroll_entry.gross_total + new_payroll_item.gross_pay
			new_payroll_entry.net_total = new_payroll_entry.net_total + new_payroll_item.net_pay
			new_payroll_item.save
		end
		if new_payroll_entry.save
			p "Saved new entry :)"
		end
		respond_to do |format|
		  format.json { render :json => {status: 200} }
		end
	end
	def check_Admin
		if current_user.role != "admin"
			redirect_to('/')
		end
	end
end
 