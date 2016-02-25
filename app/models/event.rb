class Event < ActiveRecord::Base
	mount_uploader :excelfile, ExcelFileUploader
	has_many :employees, through: :bookings, dependent: :destroy
	has_many :bookings
end
