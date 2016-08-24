class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :institute_id
      t.string :rating
      t.text :review_comment

      t.timestamps
    end

    add_foreign_key :reviews, :institutes
  end
end
