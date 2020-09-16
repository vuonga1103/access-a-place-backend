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
  place_id: "-0bdnX762vdTb9lI00etvA"
})

est2 = Establishment.create({
  place_id: "xiEBdZ8z5KY21Vw2pY2fJQ"
})

est3 = Establishment.create({
  place_id: "wYgp-defqwJPhjC6Y_WKWg"
})

est4 = Establishment.create({
  place_id: "dkAj-3gmkvdA4XkJmw6hCw"
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