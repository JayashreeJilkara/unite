class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reviews
  has_many :review_responses
  has_many :institutes
  has_one :address

  def serializable_hash(options)
    options ||= {}

    super({
        include: [:institutes]
    }.merge(options))
  end
end
