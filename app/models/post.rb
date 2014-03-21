class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  validates_presence_of :content

  DEGREES = %w(1 2 3 18 30 31 32 33)

  def self.degrees_selection(current_user)
    degrees = DEGREES.keep_if { |d| d.to_i <= current_user.degree }
  end
end
