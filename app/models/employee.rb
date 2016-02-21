class Employee < ActiveRecord::Base
	has_many :events, through: :bookings, dependent: :destroy
	has_many :bookings
	has_one :profile
end
