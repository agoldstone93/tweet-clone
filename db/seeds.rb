# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# delete previous data
Account.destroy_all
Tweet.destroy_all

# generate accounts
Account.create(name: 'User Person', username: 'user', email: 'user@example.com', password: 'user123')

5.times do
  name = Faker::Twitter.screen_name
  Account.create(name: name, username: name, email: "#{name}@example.com", password: '123456')
end

# generate tweets
30.times do
  Tweet.create(content: Faker::Lorem.sentence(word_count: 3), account_id: rand(1..6))
end
