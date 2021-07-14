class NotesController < ApplicationController
    def index 
        notes = Note.all
        
        render json: {notes: notes}
    end

    def create
        note = Note.new(note_params)
        if note
            note.save
        else
            render json: {error: 'note os not found'}
        end
    end

    def destroy
        note = Note.find(params[:id])
        if note
            note.destroy
        else
            render json: {error: 'note not found'}
        end
        render json: {message: "note is deleted"}
    end

    def update
        note = Note.find(params[:id])

        if note 
            note.update(note_params)
        else
            render json: {error: 'note not found'}
        end
    end

    private

    def note_params
        params.permit(:user_id, :text, :color, :x, :y)
    end

end
