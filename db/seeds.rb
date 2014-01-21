# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

# Create 40 wikis
wikis = []
40.times do
  wikis << Wiki.create(
    title: Faker::Lorem.words(rand(1..10)).join(" "), 
    body: Faker::Lorem.paragraph(rand(1..4),
    public: (rand <= 0.7)? true : false)
  )
end
 
rand(20..30).times do
  password = Faker::Lorem.characters(10)
  u = User.new(
    name: Faker::Name.name, 
    email: Faker::Internet.email, 
    password: password, 
    password_confirmation: password)
  u.skip_confirmation!
  u.update_attribute('premium', true) if rand >= 0.7
  u.save
end

 wikis.length.times do
 	user = User.find(rand(1..(User.all.length)))
 	if !wikis.first.public && user.premium
		user.wikis << wikis.first
	elsif !wikis.first.public && !user.premium
		user.premium = true
		user.wikis << wikis.first
	else
		user.wikis << wikis.first
	end
 	wikis.first.users << user
 	other_user = User.find(rand(1..(User.all.length)))
 	wikis.first.users << other_user unless other_user == user
 	wikis.rotate!
 end

puts "Seed finished"
puts "#{Wiki.count} wikis created"
puts "#{User.count} users created"
User.all.each do |user|
	puts user.name
	puts user.email
end