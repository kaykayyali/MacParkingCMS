class Shift < ActiveRecord::Base
	belongs_to :location
	has_one :shift_report
	belongs_to :shift_type
	belongs_to :employee
end
