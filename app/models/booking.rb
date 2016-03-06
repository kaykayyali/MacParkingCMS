class Booking < ActiveRecord::Base
	belongs_to :event
	belongs_to :employee
	belongs_to :booking_type
end
