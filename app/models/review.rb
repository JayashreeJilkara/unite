class Review < ApplicationRecord
  belongs_to :user
  has_one :institute
  has_many :review_responses
end
