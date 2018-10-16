# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.destroy_all

Cat.create!(birth_date: "20160614", name: "Fluffy", sex: "F", description: "cool cat", color: "white")
Cat.create!(birth_date: "20130718", name: "Garfield", sex: "M", description: "loves lasagna", color: "orange")
Cat.create!(birth_date: "19990426", name: "Tom", sex: "M", description: "hates Jerry", color: "grey")
Cat.create!(birth_date: "19980501", name: "Stray", sex: "U", description: "we don't know", color: "black")
