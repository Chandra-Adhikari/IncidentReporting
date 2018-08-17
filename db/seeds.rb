# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ title: 'Star Wars' }, { title: 'Lord of the Rings' }])
#   Character.create(title: 'Luke', movie: movies.first)

Incident.create([{ title: 'Alochol' }, { title: 'Assult' },
	 { title: 'Bullying' },  { title: 'Hazing' },  { title: 'Drugs' },
	 { title: 'Graffiti' },  { title: 'Injury' },  { title: 'Suspicious active' },
	 { title: 'Trespassing' },  { title: 'Vandalism' },  { title: 'Weapon Voilation' },
	 { title: 'Technology misuse' },  { title: 'Other' }])
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?