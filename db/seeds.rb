# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


   

   
require 'faker'

City.destroy_all
Dog.destroy_all
Dogsitter.destroy_all
Stroll.destroy_all
cities = %w[Marseille Paris Bordeaux Nice Monaco Strasbourg Amiens Rennes]

cities.each do |c|
  City.create(city_name:c )
end
puts
puts "Cities table"
tp City.all

50.times do
  Dog.create(name: Faker::Name.first_name, city: City.all.sample)
  Dogsitter.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city: City.all.sample)
end
puts
puts "Dogs table"
tp Dog.all

puts
puts "Dogsitters table"
tp Dogsitter.all

200.times do 
  random_city = City.all.reject {|c| c.dogs.empty? || c.dogsitters.empty?}.sample
  random_dog_from_city = Dog.where(city:random_city).sample
  random_dogsitter_from_city = Dogsitter.where(city:random_city).sample
  Stroll.create(date: Faker::Time.forward(days: 90),dog: random_dog_from_city, dogsitter: random_dogsitter_from_city )
end

puts
puts "Strolls table"
tp Stroll.all