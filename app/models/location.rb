class Location < ActiveRecord::Base
	has_many :shifts
	has_many :shift_types
	has_many :shift_reports
end
