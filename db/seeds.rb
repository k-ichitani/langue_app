# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: 'admin@example.com',
  password: '123456'
)

Teacher.create!(
  last_name: 'Tanaka',
  first_name: 'Ichiro',
  email: 'tanaka@example.com',
  telephone_number: '00000000001',
  encrypted_password: '123456',
  specialty: 'business',
  is_deleted: false,
)

Teacher.create!(
  last_name: 'Durand',
  first_name: 'Louise',
  email: 'louise@example.com',
  telephone_number: '00000000002',
  encrypted_password: '123456',
  specialty: 'culture',
  is_deleted: false
)

Student.create!(
  last_name: 'Yamda',
  first_name: 'Tarou',
  email: 'yamada@example.com',
  telephone_number: '00000000000',
  password: '123456',
  is_deleted: false
)
