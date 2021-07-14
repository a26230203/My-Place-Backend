class JournalDraftsController < ApplicationController
    def index 
        journals_draft = JournalDraft.all

        render json: journals_draft
    end

    def create
        journals_draft = JournalDraft.create(journals_draft_params)
            
        render json: {journal: journals_draft}
        
    end


    def update
        journals_draft = JournalDraft.find(params[:id])

        if journals_draft
            journals_draft.update(journals_draft_params)

            render json: {journals_draft: journals_draft}
        else
            render json: {error: "journals_draft not found" }
        end
    end

    def destroy 
        journals_draft = JournalDraft.find(params[:id])

        if journals_draft
            journals_draft.destroy
            render json: {message: "You journals_draft is deleted"}
        else 
            render json: { error: "journals_draft not found" }
    
        end
    end

    private

    def journals_draft_params
        params.permit(:user_id, :title, :content, :image)
    end


end
