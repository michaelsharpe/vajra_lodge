class Milestone < ActiveRecord::Base
  belongs_to :user

  CATEGORIES = %w(degree life membership)
  EVENTS = %w(Initiated Passed Raised Affiliated Resigned Death Other)
end
