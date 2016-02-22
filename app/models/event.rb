class Event < ActiveRecord::Base
	has_many :employees, through: :bookings, dependent: :destroy
	has_many :bookings
	mount_uploader :excel_file, ExcelFileUploader
end
