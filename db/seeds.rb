# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.create(username: "jamby", email: "irjamby@gmail.com", password: "test123", password_confirmation: "test123")
user2 = User.create(username: "tester1", email: "tester1@gmail.com", password: "test123", password_confirmation: "test123")
user3 = User.create(username: "tester2", email: "tester2@gmail.com", password: "test123", password_confirmation: "test123")
user4 = User.create(username: "tester3", email: "tester3@gmail.com", password: "test123", password_confirmation: "test123")
user5 = User.create(username: "tester4", email: "tester4@gmail.com", password: "test123", password_confirmation: "test123")
user6 = User.create(username: "tester5", email: "tester5@gmail.com", password: "test123", password_confirmation: "test123")
user7 = User.create(username: "tester6", email: "tester6@gmail.com", password: "test123", password_confirmation: "test123")
user8 = User.create(username: "tester7", email: "tester7@gmail.com", password: "test123", password_confirmation: "test123")
user9 = User.create(username: "tester8", email: "tester8@gmail.com", password: "test123", password_confirmation: "test123")
user10 = User.create(username: "tester9", email: "tester9@gmail.com", password: "test123", password_confirmation: "test123")


user1.follow(user2)
user1.follow(user4)
user1.follow(user6)
user1.follow(user8)
user1.follow(user10)

user2.follow(user1)
user2.follow(user5)
user2.follow(user7)
user2.follow(user10)

user3.follow(user1)
user3.follow(user9)
user3.follow(user2)

user4.follow(user1)
user4.follow(user3)
user4.follow(user5)
user4.follow(user9)
user4.follow(user10)
user4.follow(user6)