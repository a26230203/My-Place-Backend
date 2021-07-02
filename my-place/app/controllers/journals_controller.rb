class JournalsController < ApplicationController

    def index 
        journals = Journal.all

        render json: journals
    end

    def create
        journal = Journal.create(journal_params)
            
        render json: {journal: JournalSerializer.new(journal)}
        
    end

    def update
        journal = Journal.find(params[:id])

        if journal
            journal.update(journal_params)

            render json: {journal: JournalSerializer.new(journal)}
        else
            render json: {error: "Jouranl not found" }
        end
    end

    def destroy 
        journal = Journal.find(params[:id])

        if journal
            journal.destroy
            render json: {message: "You Jouranl is deleted"}
        else 
            render json: { error: "Jouranl not found" }
    
        end
    end

    private

    def journal_params
        params.permit(:user_id, :title, :content, :image)
    end

end
