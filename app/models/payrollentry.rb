class Payrollentry < ActiveRecord::Base
	has_many :payrollitems
end
