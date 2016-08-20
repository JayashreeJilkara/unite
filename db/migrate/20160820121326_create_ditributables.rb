class CreateDitributables < ActiveRecord::Migration[5.0]
  def change
    create_table :ditributables do |t|
      t.integer :institute_id
      t.string :file_name
      t.string :file_url

      t.timestamps
    end

    add_foreign_key :ditributables, :institutes
  end
end
