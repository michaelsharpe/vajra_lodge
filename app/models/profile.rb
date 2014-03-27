class Profile < ActiveRecord::Base
  belongs_to :user

  validates_uniqueness_of :email

  include RoleModel
  roles_attribute :roles_mask
  roles :Admin, :Secretary, :Treasurer, :Candidate, :RWM, :WSW, :WJW, :IM
end