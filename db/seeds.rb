# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])



require 'faker'

User.create name: "Hari Kalanj",
         email: "hkalanj@gmail.com",
         password: "12345678",
         password_confirmation: "12345678"

#User.create name: "Htoo Myat",
 #        email: "htoomyatag@gmail.com",
  #       password: "12345678",
   #      password_confirmation: "12345678"


# Generate 50 task to test with
50.times do

	title = Faker::Hipster.word
    desc  = Faker::Hipster.paragraph
    duedate = Faker::Date.forward(15)

  Task.create title: title,
              description: desc,
  			  tstage: 'to do',
  			  duedate: duedate,
  			  user_id: '1'

end