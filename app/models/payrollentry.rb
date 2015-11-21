class Payrollentry < ActiveRecord::Base
	has_many :payrollitems
	def creator
		return User.find_by_id(self.user_id)
	end
end
