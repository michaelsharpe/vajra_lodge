# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

r = Random.new
roles = %w[Admin Treasurer Secretary Candidate]

1.upto(5) do |i|
  u = User.create!(username: "user#{i}", password:"test888",password_confirmation:"test888")
  p = Profile.create!(degree: r.rand(1..33), admin: (i == 1), roles: roles[i-1], disabled: false, full_name: "User #{i}", email: "test#{i}@test.com", address: "#{Faker::Address.street_address} #{Faker::Address.street_name}", phone: Faker::PhoneNumber.phone_number, bio: Faker::Lorem.paragraphs(r.rand(1..3)).join("\n\n"))
  u.profile = p
  5.times do |i|
    u.milestones.create!(user_id: u.id, category: Milestone::CATEGORIES[r.rand(1..(Milestone::CATEGORIES.length - 1))], event: Milestone::EVENTS[r.rand(1..(Milestone::EVENTS.length - 1))], date: Date.new(r.rand(2010..2014), r.rand(1..12), r.rand(1..30)), location: Faker::Address.city, description: Faker::Lorem.paragraphs(r.rand(1..3)).join("\n\n"))
  end
end

100.times do |i|
  Post.create!(user_id: r.rand(1..5), degree: r.rand(1..33), content: Faker::Lorem.paragraphs(r.rand(1..5)).join("\n\n"))
end

200.times do |i|
  post = r.rand(1..100)
  comment = Post.find(post).comments.build(post_id: post, user_id: r.rand(1..5), content: Faker::Lorem.paragraphs(r.rand(1..3)).join("\n"))
  comment.save
end

20.times do |i|
  day = r.rand(1..30)
  month = r.rand(1..12)
  year = r.rand(2010..2014)
  date = Date.new(year,month,day)
  Minute.create!(degree: r.rand(1..33), date: date, open: r.rand(10..12), close: r.rand(1..4), content: Faker::Lorem.paragraphs(r.rand(1..4)).join("\n\n"), reviewed: false)
end