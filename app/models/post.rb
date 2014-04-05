class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  validates_presence_of :content

  acts_as_taggable

  DEGREES = %w(1 2 3 18 30 31 32 33)

  def self.degrees_selection(current_user)
    DEGREES.select { |d| d.to_i <= current_user.profile.degree }
  end
end
