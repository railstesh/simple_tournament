# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Role.create!([
  { name: :user},
  { name: :admin}
])
p "Created #{Role.count} Roles"

User.create!([
  { email: 'admin@yopmail.com', password: '12345678' },
  { email: 'user1@yopmail.com', password: '12345678' },
  { email: 'user2@yopmail.com', password: '12345678' },
  { email: 'user3@yopmail.com', password: '12345678' },
  { email: 'user4@yopmail.com', password: '12345678' },
  { email: 'user5@yopmail.com', password: '12345678' },
])
p "Created #{User.count} Users"
User.find_by_email('admin@yopmail.com').add_role(:admin)

Tournament.create!([
  { name: "tournament1" },
  { name: "tournament2" },
  { name: "tournament3" },
])
p "Created #{Tournament.count} Tournaments"

