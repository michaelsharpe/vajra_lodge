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
  u = User.create!(username: "user#{i}", email: "test#{i}@test.com", password:"test888",password_confirmation:"test888")
  u.create_profile(degree: r.rand(1..33), roles: roles[i-1], disabled: false, address: "#{Faker::Address.street_address} #{Faker::Address.street_name}", phone: Faker::PhoneNumber.phone_number, bio: Faker::Lorem.paragraphs(r.rand(1..3)).join("\n\n"))
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