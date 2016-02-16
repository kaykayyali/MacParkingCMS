class Event < ActiveRecord::Base
	has_many :employees, through: :bookings, dependent: :destroy
end
