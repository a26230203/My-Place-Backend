class CreateNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      t.integer :user_id
      t.string :text
      t.string :color
      t.string :x
      t.string :y

      t.timestamps
    end
  end
end
