class CreateReviewResponses < ActiveRecord::Migration[5.0]
  def change
    create_table :review_responses do |t|
      t.integer :user_id
      t.integer :review_id
      t.text :comment

      t.timestamps
    end

    add_foreign_key :review_responses, :users
    add_foreign_key :review_responses, :reviews
  end
end
