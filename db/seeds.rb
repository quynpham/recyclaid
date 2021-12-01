# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning database..."
Buying.destroy_all
Order.destroy_all
Material.destroy_all
User.destroy_all

puts "Creating materials..."
user1 = User.create!({ email: "Quynh-Anh@lewagon.be", password: "recyclaid", name: "Quynh-Anh", description: "My windows are the best, don't even consider buying from someone else." })
user2 = User.create!({ email: "kato@lewagon.be", password: "recyclaid", name: "Kato", description: "The wood I provide is always fresh from the day, I chop it myself :)" })
user3 = User.create!({ email: "dorian@lewagon.be", password: "recyclaid", name: "Dorian", description: "I am a true sand lover !" })

photo1 = 'https://images.pexels.com/photos/923167/pexels-photo-923167.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'
photo2 = 'https://www.aanbod.be/img/600x600/23967177/1/pvc-ramen-particuliere-verkoop-prijs-zie-tekst.jpg'
photo3 = 'https://www.hnl-fencing.co.uk/wp-content/uploads/2020/06/sand-build-scaled.jpg'
profileDorian = 'https://avatars.githubusercontent.com/u/91681036?v=4'
profileQA = 'https://avatars.githubusercontent.com/u/88784113?v=4'
profileKato = 'https://avatars.githubusercontent.com/u/90604908?s=400&u=121891aed02f1f0338c1164b23972642156546d2&v=4'

material1 = Material.create!({ name: "Kato's wood", description: "I have some wood left over from breaking down my shed.", location: "Cantersteen 12, 1000 Bruxelles", price: 5000, user: user2, sku: 'kato-wood' })
material2 = Material.create!({ name: "Quynh-Anh's windows", description: "I bought the wrong windows for my house, so now I'm selling them here.", location: "Rue du MArché aux Herbes 56, 1000 Bruxelles", price: 4000, user: user1, sku: 'Quynh-Anh-windows' })
material3 = Material.create!({ name: "Dorian's sand", description: "I am building my house myself and I dug up a lot of sand!", location: "Chaussée d'Alsemberg 252, 1190 Forest", price: 4000, user: user3, sku: 'dorian-sand' })

material1.photos.attach(io: URI.open(photo1), filename: "wood.png", content_type: 'image/jpeg')
material2.photos.attach(io: URI.open(photo2), filename: "window.png", content_type: 'image/jpeg')
material3.photos.attach(io: URI.open(photo3), filename: "sand.png", content_type: 'image/jpeg')

user1.photo.attach(io: URI.open(profileQA), filename: "QA.png", content_type: 'image/jpag')
user2.photo.attach(io: URI.open(profileKato), filename: "Kato.png", content_type: 'image/jpag')
user3.photo.attach(io: URI.open(profileDorian), filename: "Dorian.png", content_type: 'image/jpag')
