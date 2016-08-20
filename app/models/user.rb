class User < ApplicationRecord
  has_many :reviews
  has_many :review_responses
  has_one :address
end
