class ShiftReport < ActiveRecord::Base
	belongs_to :shift 
	belongs_to :location
end
