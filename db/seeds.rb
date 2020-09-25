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
  alias: "osteria-brooklyn-brooklyn",
  name: "Osteria Brooklyn",
  image_url: "https://s3-media1.fl.yelpcdn.com/bphoto/QzJCcB5xHxvom5Ykn16EVA/o.jpg",
  is_closed: false,
  phone: "(646) 750-9156",
  categories: ["Italian"],
  location: [
    "458 Myrtle Ave",
    "Brooklyn, NY 11205"
  ], 
  coordinates: {
    latitude: 40.693154,
    longitude: -73.967177
  }
})

est2 = Establishment.create({
  place_id: "FcHVRbMcYY-D1Glzwo3ofA",
  alias: "mr-bao-brooklyn",
  name: "MR BAO",
  image_url: "https://s3-media4.fl.yelpcdn.com/bphoto/DOtT38IBRaEdOMnNDrFlTA/o.jpg",
  is_closed: false,
  phone: "",
  categories: ["Shanghainese", "Asian Fusion"],
  location: [
    "179 5th Ave",
    "Brooklyn, NY 11217"
  ], 
  coordinates: {
    latitude: 40.67719,
    longitude: -73.97981
  }
})

est3 = Establishment.create({
  place_id: "J8umpkNXrswbTXqLl9HteQ",
  alias: "strangeways-brooklyn",
  name: "Strangeways",
  image_url: "https://s3-media4.fl.yelpcdn.com/bphoto/FVgIh9SDzQokWYDYFD4LTQ/o.jpg",
  is_closed: false,
  phone: "",
  categories: ["Bars", "American (New)"],
  location: [
    "302 Metropolitan Ave",
    "Brooklyn, NY 11211"
  ], 
  coordinates: {
    latitude: 40.714415,
    longitude: -73.957989
  }
})

est4 = Establishment.create({
  place_id: "6jPju63RQy3P3ov9-ejP7g",
  alias: "sea-wolf-williamsburg-waterfront-new-york-2",
  name: "Sea Wolf - Williamsburg Waterfront",
  image_url: "https://s3-media3.fl.yelpcdn.com/bphoto/Jr-s32hkBKOMgOpLkdA4Tg/o.jpg",
  is_closed: false,
  phone: "(718) 782-9213",
  categories: ["Seafood"],
  location: [
    "420 Kent Ave",
    "New York, NY 11249"
  ], 
  coordinates: {
    latitude: 40.709946,
    longitude: -73.968608
  }
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

bookmark1 = Bookmark.create({
  user: fluffy,
  establishment: est1
})

bookmark2 = Bookmark.create({
  user: fluffy,
  establishment: est2 
})

bookmark4 = Bookmark.create({
  user: misty,
  establishment: est3
})

bookmark5 = Bookmark.create({
  user: misty,
  establishment: est4 
})

puts "Finished Seeding."