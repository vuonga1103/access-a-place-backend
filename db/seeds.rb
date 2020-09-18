# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Establishment.destroy_all
Review.destroy_all

fluffy = User.create({
  email: "fluffy@fluffy.com",
  first_name: "Fluffy",
  last_name: "Cat",
  password: "fluffy"
})

misty = User.create({
  email: "misty@misty.com",
  first_name: "Misty",
  last_name: "Cat",
  password: "misty"
})

muffin = User.create({
  email: "muffin@muffin.com",
  first_name: "Muffin",
  last_name: "Sloth",
  password: "muffin"
})

biscuit = User.create({
  email: "biscuit@biscuit.com",
  first_name: "Biscuit",
  last_name: "Sloth",
  password: "biscuit"
})

est1 = Establishment.create({
  place_id: "4zw8vEJNc4mcHh2ARzj2gw",
  name: "Osteria Brooklyn"
})

est2 = Establishment.create({
  place_id: "J8umpkNXrswbTXqLl9HteQ",
  name: "Strangeways"
})

est3 = Establishment.create({
  place_id: "6jPju63RQy3P3ov9-ejP7g",
  name: "Sea Wolf - Williamsburg Waterfront"
})

est4 = Establishment.create({
  place_id: "4MDltWx_2dxzTEv6mTRfSQ",
  name: "Rangoon"
})

rev1 = Review.create({
  user: fluffy,
  establishment: est1,
  entrance_rating: 1,
  bathroom_rating: 3,
  parking_rating: 5,
  interior_rating: 3,
  content: "has handicap parking, but no ramp entrance"
})

rev2 = Review.create({
  user: misty,
  establishment: est2,
  entrance_rating: 5,
  bathroom_rating: 5,
  parking_rating: 1,
  interior_rating: 5,
  content: "no accessible parking, but otherwise great"
})

rev3 = Review.create({
  user: muffin,
  establishment: est3,
  entrance_rating: 1,
  bathroom_rating: 1,
  parking_rating: 1,
  interior_rating: 1,
  content: "croweed, not at all accessible, do no recommend"
})

rev4 = Review.create({
  user: biscuit,
  establishment: est4,
  entrance_rating: 3,
  bathroom_rating: 3,
  parking_rating: 3,
  interior_rating: 3,
  content: "not bad"
})

puts "Finished Seeding."