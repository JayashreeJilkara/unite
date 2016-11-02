class Course < ApplicationRecord
  belongs_to :institute, optional: true
end
