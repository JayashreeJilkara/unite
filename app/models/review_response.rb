class ReviewResponse < ApplicationRecord
  has_one :review
  has_one :user
end
