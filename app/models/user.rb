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
  has_and_belongs_to_many :lodges

  accepts_nested_attributes_for :profile

  def admin?
    self.profile.admin
  end

  def candidate?
    self.has_role?(:Candidate)
  end

  def has_role?(role)
    self.profile.has_role?(role)
  end

  def membership_events
    self.milestones.where("event = 'Initiated' OR event = 'Affiliated' OR event = 'Resigned' OR event = 'Death'").sort_by { |stone| stone.date }
  end

  def member_at?(date)
    events_affecting_membership = self.membership_events
    member = false

    events_affecting_membership.each do |event|
      if event.date <= date
        if event.event == 'Initiated' || event.event == 'Affiliated'
          member = true
        elsif event.event == 'Resigned' || event.event == 'Death'
          member = false
        end
      else
        break
      end
    end

    member
  end

  private
  def create_profile
    self.create_profile!(user_id: self.id)
  end
end
