class NotesController < ApplicationController
	before_action(:authenticate_user!)
	def index
		render 'index'
	end
	def create
		newNote = Note.new()

	end
	def new
		render 'new'
	end
end
