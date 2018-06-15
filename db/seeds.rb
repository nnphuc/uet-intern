# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create( email: "admin@gmail.com",
              password: "123123",
              role: 3
  )


User.create([
    {email:"admin@gmail.com",password:"123123",role: :admin},
    {email:"st1@gmail.com",password:"123123",role: :student},
    {email:"lt1@gmail.com",password:"123123",role: :lecturer},
    {email:"pn1@gmail.com",password:"123123",role: :partner},
    {email:"pn2@gmail.com",password:"123123",role: :partner},
    {email:"pn3@gmail.com",password:"123123",role: :partner},
    {email:"pn4@gmail.com",password:"123123",role: :partner},
    {email:"pn5@gmail.com",password:"123123",role: :partner},
])
