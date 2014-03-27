class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :password, length: {minimum: 3}
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  # validates_uniqueness_of :email

  has_one :profile
  has_many :posts
  has_many :comments
end
