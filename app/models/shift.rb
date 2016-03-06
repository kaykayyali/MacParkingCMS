class Shift < ActiveRecord::Base
	belongs_to :location
	has_one :shift_report
	has_one :shift_type
end
