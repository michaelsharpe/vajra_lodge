class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :password, length: {minimum: 3}
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  include RoleModel
  roles_attribute :roles_mask

  roles :admin, :secretary, :treasurer
end
