class Employee < ActiveRecord::Base
	has_many :events, through: :bookings, dependent: :destroy
end
