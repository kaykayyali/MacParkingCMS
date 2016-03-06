class BookingType < ActiveRecord::Base
	has_many :bookings
end
