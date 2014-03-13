# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

r = Random.new
roles = %w[admin treasurer secretary]

1.upto(5) do |i|
  User.create!(username: "user#{i}", email: "test@test.com", password:"test888",password_confirmation:"test888",roles: "#{roles[i-1]}",degree: r.rand(1..33), bio: Faker::Lorem.paragraphs(r.rand(1..3)).join("\n\n"))
end

100.times do |i|
  Post.create!(user_id: r.rand(1..5), degree: r.rand(1..33), content: Faker::Lorem.paragraphs(r.rand(1..5)).join("\n\n"))
end