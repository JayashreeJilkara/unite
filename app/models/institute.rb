class Institute < ApplicationRecord
  has_one :address
  belongs_to :user
  has_many :distributables
  has_many :courses
  has_many :reviews
end
