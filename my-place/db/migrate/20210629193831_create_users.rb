class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :name
      t.string :image
      t.string :address
      t.string :post_code
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
