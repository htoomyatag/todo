# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])



users = User.create([


{name: "htoomyatag1", email: "htoomyatag1@gmail.com", password: "12345678", password_confirmation: "12345678"},
{name: "htoomyatag2", email: "htoomyatag2@gmail.com", password: "12345678", password_confirmation: "12345678"},
{name: "htoomyatag3", email: "htoomyatag3@gmail.com", password: "12345678", password_confirmation: "12345678"},


   ])



tasks = Task.create([


{title: "task1", description: "task1desc", tstage: "to do",user_id: 1, coworker:"[2,3]", tcategories:"[design,development]"},
{title: "task2", description: "task2desc", tstage: "in progress",user_id: 2, coworker:"[1,3]", tcategories:"[logistics,administration]"},
{title: "task3", description: "task3desc", tstage: "completed",user_id: 3, coworker:"[1,2]", tcategories:"[marketing]"}



   ])
