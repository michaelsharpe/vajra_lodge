class Profile < ActiveRecord::Base
  belongs_to :user

  include RoleModel
  roles_attribute :roles_mask
  roles :Admin, :Secretary, :Treasurer, :Candidate
end
