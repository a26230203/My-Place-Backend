class CreateMusics < ActiveRecord::Migration[6.1]
  def change
    create_table :musics do |t|
      t.integer :user_id
      t.string :title
      t.string :description
      t.string :author
      t.string :img

      t.timestamps
    end
  end
end
