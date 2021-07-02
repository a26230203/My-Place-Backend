class JouranlImage < ApplicationRecord
    belongs_to :journal 
    belongs_to :journal_draft
    has_one_attached :image

    validate :journal_id, :journal_draft_id,  allow_nil: true
end
