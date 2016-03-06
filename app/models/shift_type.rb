class ShiftType < ActiveRecord::Base
	has_many :shifts
	belongs_to :location
end
