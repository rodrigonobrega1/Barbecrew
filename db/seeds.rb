# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
puts "Destroy old barbecues"
Barbecue.delete_all
User.delete_all
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create!(email: "teste@gmail.com", password: "123456" )

puts "Make new grills"
barbecue1 = Barbecue.create!(
  barbecue_model:"SuperGrill 458786 Brastemp",
  barbecue_type: "Eletric",
  barbecue_price: 154,
  user: user1,
  barbecue_description:"This barbecue was used only 4 times. It has Solar Panels that provides hald of the energy it needs too works",
  barbecue_location:"Setúbal, Portugal",
  picture: "https://product-images.weber.com/capacity-images/pulse-2000.png?auto=compress,format&fit=fill&h=950&w=1000&trim=color&trimtol=10&bg=0FFF&pad=50.png"
)
barbecue2 = Barbecue.create!(barbecue_model:"BarbeCrud Tramontina 99STP55",barbecue_type: "Carvão", barbecue_price: 73, user: user1, barbecue_description:"The perfect barbecue to give a smoked touch to your meet!", barbecue_location:"Carcavelos, Portugal", picture: "https://res.cloudinary.com/student-le-wagon/image/upload/v1653488461/barbecrew/81965921-0100-barbecueacarvo-opprectangular74x56cm_vagofz.jpg")
barbecue3 = Barbecue.create!(barbecue_model:"SuperGrill 458786 Brastemp",barbecue_type: "Eletric", barbecue_price: 154, user: user1, barbecue_description:"This barbecue was used only 4 times. It has Solar Panels that provides hald of the energy it needs too works", barbecue_location:"Setúbal, Portugal", picture: "https://res.cloudinary.com/student-le-wagon/image/upload/v1653488461/barbecrew/1643277414_85b79ccf557772c3c0cb77b85e428310_b9k93v.jpg")
barbecue4 = Barbecue.create!(barbecue_model:"BarbeCrud Tramontina 99STP55",barbecue_type: "Carvão", barbecue_price: 73, user: user1, barbecue_description:"The perfect barbecue to give a smoked touch to your meet!", barbecue_location:"Carcavelos, Portugal", picture: "https://res.cloudinary.com/student-le-wagon/image/upload/v1653488461/barbecrew/images_f0mrq0.jpg")

puts "Make new bookings"
booking1 = Bookings.create!(date_in: 05/06/2022, date_in: 25/06/2022, barbecue_id: 2 )
booking2 = Bookings.create!(date_in: 05/09/2022, date_in: 25/09/2022, barbecue_id: 3 )
