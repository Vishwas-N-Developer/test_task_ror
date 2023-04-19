# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

# Create categories
categories = []
3.times do
  categories << Category.create(name: Faker::Lorem.word)
end

# Create unconfirmed users
10_000.times do |n|
  email = Faker::Internet.email
  password = 'password'
  confirmed_at = nil
  User.create!(email: email, password: password, confirmed_at: confirmed_at)
end

# Create confirmed users
1_000.times do |n|
  email = Faker::Internet.email
  password = 'password'
  confirmed_at = Time.now.utc
  User.create!(email: email, password: password, confirmed_at: confirmed_at)
end

# Confirm unconfirmed users
User.where(confirmed_at: nil).find_each do |user|
  user.update_attributes(confirmed_at: Time.now.utc)
end

# Create articles
20_000.times do |n|
  title = Faker::Lorem.sentence
  description = Faker::Lorem.paragraphs(number: rand(1..10)).join("\n\n")
  author_id = User.order('RANDOM()').first
  category = categories.sample
  Article.create!(title: title, description: description, author_id: author_id, category: category)
end