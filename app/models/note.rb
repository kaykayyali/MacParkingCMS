class Note < ActiveRecord::Base
	belongs_to :user
	belongs_to :note_type
	belongs_to :note_location
	def type
		return self.note_type.name
	end
	def location
		return self.note_location.name
	end
end
