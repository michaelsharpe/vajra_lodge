class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  validates_presence_of :content

  DEGREES = %w(1 2 3 18 30 31 32 33)
end
