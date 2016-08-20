class Review < ApplicationRecord
  has_one :user
  has_one :institute
  has_many :review_responses
end
