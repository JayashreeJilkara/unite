class Institute < ApplicationRecord
  mount_uploader :image, InstituteImageUploader

  has_one :address
  belongs_to :user
  has_many :distributables
  has_many :courses
  has_many :reviews
  accepts_nested_attributes_for :courses, allow_destroy: true
end
