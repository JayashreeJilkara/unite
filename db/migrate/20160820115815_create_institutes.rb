class CreateInstitutes < ActiveRecord::Migration[5.0]
  def change
    create_table :institutes do |t|
      t.integer :user_id
      t.string :name
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end
