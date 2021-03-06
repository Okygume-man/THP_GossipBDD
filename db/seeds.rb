# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all
City.destroy_all
Gossip.destroy_all
Tag.destroy_all
JoinTableGossipTag.destroy_all
PrivateMessage.destroy_all

10.times do 
City.create(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
end

10.times do
User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, mail: Faker::Internet.email, description: Faker::Quote.famous_last_words, age: rand(18..100))
end

20.times do 
Gossip.create(title: Faker::Game.title, content: Faker::Quotes::Shakespeare.hamlet_quote, user: User.all.sample)
end

10.times do 
Tag.create(title: Faker::JapaneseMedia::OnePiece.island)
end

15.times do
	JoinTableGossipTag.create(gossip: Gossip.all.sample, tag: Tag.all.sample)
end

10.times do
	PrivateMessage.create(content: Faker::JapaneseMedia::OnePiece.quote,recipient: User.all.sample,sender: User.all.sample)
end
