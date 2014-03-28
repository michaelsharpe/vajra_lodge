class Milestone < ActiveRecord::Base
  belongs_to :user

  CATEGORIES = %w(degree life affiliation)
  EVENTS = %w(Initiation Passing Raising Affiliation Resignation Deathg)
end
