# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'bcrypt'
User.create(username: "Mike", password_digest: BCrypt::Password.create('test'), image_url: 'ThisTest', bio: 'ThisIsATest')
Recipe.create(title: "Test Rec", instructions: "Testinrbjkrbkreknlrnvlrnvlernlrnljtbtpbjptbjptjbptjkpjpkrjgrjgjgporjogjrogjotjgotjojtohjtohjotjhojhojhhjo4bjorgjiorjgo4jhgoejhioeg", minutes_to_complete: 30, user_id: 1)