class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.string :username, unique: true
      t.string :password
      t.string :hometown
      t.text :bio
      t.attachment :avatar

      t.timestamps
    end
  end
end
