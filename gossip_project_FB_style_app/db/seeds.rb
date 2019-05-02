# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

def destroy_table_instances
	User.destroy_all
	City.delete_all
	Gossip.destroy_all
	Tag.destroy_all
	JoinTableTagGossip.destroy_all
	PrivateMessage.destroy_all
end

def city_create
	22.times do
		City.create!(name: Faker::Address.city, zip_code: "#{Faker::Number.within(10..95)}000")
	end
end

def user_create
	city_first_id = City.first.id
	city_last_id = City.last.id

	22.times do 
		User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: "Bonjour jeune zoulou, je suis un mongol de type martien qui débarque sur Terre", email: Faker::Internet.email, age: Faker::Number.within(10..80), city_id: Faker::Number.within(city_first_id..city_last_id))
	end
end

def gossip_create
	user_first_id = User.first.id
	user_last_id = User.last.id

	22.times do
		Gossip.create!(title: "#{Faker::Artist.name}", content: "#{Faker::Movie.quote}", user_id: Faker::Number.within(user_first_id..user_last_id))
	end
end

def tag_create	
	22.times do
		Tag.create!(title: "##{Faker::Hipster.word}")
	end
end

def private_msg_create
	user_first_id = User.first.id
	user_last_id = User.last.id
	22.times do 
		PrivateMessage.create!(content: "Salut mon grand bandit !! tu veux me faire les fesses ? :D", sender_id: Faker::Number.within(user_first_id..user_last_id), recipient_id: Faker::Number.within(user_first_id..user_last_id))
	end
end

def joint_table_create
	gossip_first_id = Gossip.first.id
	gossip_last_id = Gossip.last.id
	tag_first_id = Tag.first.id
	tag_last_id = Tag.last.id	
	22.times do 
		JoinTableTagGossip.create!(tag_id: Faker::Number.within(tag_first_id..tag_last_id), gossip_id: Faker::Number.unique.within(gossip_first_id..gossip_last_id))
	end
end


def perform
	destroy_table_instances
	#city_create
	#user_create
	#gossip_create
	#tag_create
	#private_msg_create
	#joint_table_create
	
end
perform

puts "Tâche effectuée"






