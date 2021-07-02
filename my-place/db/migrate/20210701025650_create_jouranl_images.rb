class CreateJouranlImages < ActiveRecord::Migration[6.1]
  def change
    create_table :jouranl_images do |t|
      t.integer :journal_id 
      t.integer :journal_draft_id
      t.string :imageUrl

      t.timestamps
    end
  end
end
