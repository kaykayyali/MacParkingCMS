class NotesController < ApplicationController
	before_action(:authenticate_user!)
	def index
		@notes = Note.all.where('user_id = ?', current_user.id)
		render 'index'
	end
	def create
		note_info = note_params
		newNote = Note.new()
		newNote.date = note_info[:date]
		newNote.content = note_info[:content]
		newNote.subject = note_info[:subject]
		newNote.note_type_id = note_info[:note_type]
		newNote.note_location_id = note_info[:note_location]
		newNote.user_id = current_user.id
		if newNote.save 
			redirect_to('/notes')
		end
	end
	def new
		@note_types = NoteType.all
		@note_locations = NoteLocation.all
		render 'new'
	end
	def show
		@note = Note.find_by_id(params[:id])
	end
	def note_params
		params.permit(:content, :date, :subject, :note_type, :note_location)
	end
end
