class Milestone < ActiveRecord::Base
  belongs_to :user

  CATEGORIES = %w(degree life membership)
  EVENTS = %w(Initiation Passing Raising Affiliation Resignation Death Other)
end
