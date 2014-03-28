class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :password, length: {minimum: 3}
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates_uniqueness_of :username

  has_one :profile
  has_many :milestones
  has_many :posts
  has_many :comments

  def admin?
    self.profile.admin
  end

  def has_role?(role)
    self.profile.has_role?(role)
  end
end
