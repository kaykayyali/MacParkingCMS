class Booking < ActiveRecord::Base
	belongs_to :event
	belongs_to :employee
end
