# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

20.times do |n|
  email = Faker::Internet.email
  password = "password"
  name = Faker::Name.name
  uid = Faker::Twitter.status
  provider = Faker::Twitter.status
  avatar = Faker::Avatar.image
  image_url = Faker::Avatar.image
  user = User.create!(email: email,
               password: password,
               password_confirmation: password,
               name: name,
               uid: uid,
               provider: provider,
               avatar: avatar,
               image_url: image_url
               )
  collection = Collection.create!(title: "rails 勉強会",
                content: "hoge",
                place: "渋谷",
                date: "2017-10-28",
                starttime: "10:00",
                endtime: "12:00",
                capacity: "10",
                user_id: user.id,
                picture: image_url
               )
  end
