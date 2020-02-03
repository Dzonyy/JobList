# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Employee.delete_all
Employee.create(email: 'admin@example.com', password: '123qwe123', first_name: 'Admin', last_name: 'Admin')

Category.create(name: 'Frontend')
Category.create(name: 'Backend')
Category.create(name: 'DevOps')
