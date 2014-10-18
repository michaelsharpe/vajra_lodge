class Lodge < ActiveRecord::Base
  has_many :users

  validates_uniqueness_of :number
end
