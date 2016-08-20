class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.integer :institute_id
      t.string :pin_code, :limit => 20, null: false
      t.string :city, null: false
      t.string :phone_number, null: false
      t.text :address, null: false

      t.timestamps
    end

    add_foreign_key :addresses, :users
    add_foreign_key :addresses, :institutes
  end
end
