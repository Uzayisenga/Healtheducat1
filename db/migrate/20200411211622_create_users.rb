class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :login
      t.integer :clearance
      t.string :name
      t.string :surname
      t.string :email
      t.string :ip_address
      t.string :salt
      t.string :hashed_password
      t.boolean :activated

      t.timestamps
    end
  end
end
