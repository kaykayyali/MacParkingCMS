class NotesController < ApplicationController
	before_action(:authenticate_user!)
	def index
		@notes = Note.all.where('user_id = ?', current_user.id)
		render 'index'
	end
	def create
		newNote = Note.new(note_params)
		newNote.user_id = current_user.id
		if newNote.save 
			redirect_to('/notes')
		end
	end
	def new
		render 'new'
	end
	def note_params
			params.permit(:content, :date, :subject)
	end
end
