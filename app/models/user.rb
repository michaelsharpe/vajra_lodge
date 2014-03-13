class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :password, length: {minimum: 3}
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates_presence_of :degree
  validates_uniqueness_of :email

  include RoleModel
  roles_attribute :roles_mask
  roles :Admin, :Secretary, :Treasurer

  has_many :posts
end
