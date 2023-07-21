# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

admin_params = {
  first_name: 'Pam',
  last_name: 'Jasme',
  email: 'pamjtest@gmail.com',
  password: 'passw0rd'
}
User.first_or_create(admin_params)

listings = [
  {
    name: "Santorini, Greece",
    grade: "CULTURAL RELAX ",
    fees: 100,
    description: "Discover the stunning beauty of Santorini, Greece with its picturesque white-washed buildings and breathtaking views of the Aegean Sea."
  },
  {
    name: "Bora Bora, French Polynesia",
    grade: "CULTURAL RELAX ",
    fees: 150,
    description: "Escape to the tropical paradise of Bora Bora, French Polynesia, where you can relax on pristine beaches and explore the vibrant coral reefs."
  },
  {
    name: "Kyoto, Japan",
    grade: "CULTURAL RELAX ",
    fees: 200,
    description: "Immerse yourself in the rich culture and history of Kyoto, Japan. Visit ancient temples, participate in traditional tea ceremonies, and admire the beauty of cherry blossoms."
  },
  {
    name: "New York City, USA",
    grade: "CULTURAL RELAX ",
    fees: 180,
    description: "Experience the vibrant energy of New York City, USA. Explore iconic landmarks such as Times Square, Statue of Liberty, and Central Park."
  },
  {
    name: "Machu Picchu, Peru",
    grade: "CULTURAL RELAX ",
    fees: 250,
    description: "Journey to the ancient Incan citadel of Machu Picchu, Peru. Hike through breathtaking mountain landscapes and witness the architectural marvels of the past."
  },
  {
    name: "Paris, France",
    grade: "CULTURAL RELAX ",
    fees: 220,
    description: "Experience the romance and charm of Paris, France. Visit the Eiffel Tower, explore the Louvre Museum, and indulge in delicious French cuisine."
  },
  {
    name: "Cape Town, South Africa",
    grade: "CULTURAL RELAX ",
    fees: 180,
    description: "Explore the diverse beauty of Cape Town, South Africa. Discover stunning beaches, hike Table Mountain, and visit the vibrant V&A Waterfront."
  }
]

listings.each do |listing|
  list = Listing.where(name: listing[:name]).first_or_initialize
  list.grade       = listing[:grade]
  list.fees        = listing[:fees]
  list.description = listing[:description]
  list.save
end
