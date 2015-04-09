# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

#Create Users
10.times do
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)    
    )
  user.skip_confirmation!
  user.save!
end
users = User.all

#Create Wikis
20.times do
  Wiki.create!(
    user:     users.sample,
    title:    Faker::Company.catch_phrase,
    body:     Faker::Hacker.say_something_smart
    )
end

first_user = User.first
first_user.skip_reconfirmation!
first_user.update_attributes!(
  name:  'pw220',
  email: 'pw220@me.com',
  password: 'testtest',
  role:   'admin'
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
puts "The first user's email is #{first_user.email} and password is #{first_user.password}."