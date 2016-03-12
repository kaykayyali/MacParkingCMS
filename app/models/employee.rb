class Employee < ActiveRecord::Base
	has_many :events, through: :bookings, dependent: :destroy
	has_many :bookings
	has_one :profile
	has_many :shifts
end

def profile
	return Profile.find(employee_id: self.id)
end