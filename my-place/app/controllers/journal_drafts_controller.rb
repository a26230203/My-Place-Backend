class JournalDraftsController < ApplicationController
    def index 
        journals_draft = JournalDraft.all

        render json: journals_draft
    end

    def create
        journals_draft = JournalDraft.create(journals_draft_params)
            
        render json: {journal: JournalDraftSerializer.new(journals_draft)}
        
    end

    private

    def journals_draft_params
        params.permit(:user_id, :title, :content, :image)
    end


end
