class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, :limit => 100, null: false
      t.string :password, null: false
      t.column :is_admin, :boolean, default: false
      t.text :occupation

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
