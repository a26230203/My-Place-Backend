class CreateJournalDrafts < ActiveRecord::Migration[6.1]
  def change
    create_table :journal_drafts do |t|
      t.integer :user_id
      t.string :title
      t.text :content
      
      t.timestamps
    end
  end
end
