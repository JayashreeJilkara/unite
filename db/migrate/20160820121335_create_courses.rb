class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.integer :institute_id
      t.string :course_name
      t.integer :fee_structure
      t.string :duration

      t.timestamps
    end

    add_foreign_key :courses, :institutes
  end
end
