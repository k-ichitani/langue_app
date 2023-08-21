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
  password: '123456',
  specialty: 'business',
  is_deleted: false,
)

Teacher.create!(
  last_name: 'Durand',
  first_name: 'Louise',
  email: 'louise@example.com',
  telephone_number: '00000000002',
  password: '123456',
  specialty: 'culture',
  is_deleted: false
)

Teacher.create!(
  last_name: 'Richard',
  first_name: 'Emma',
  email: 'emma@example.com',
  telephone_number: '00000000003',
  password: '123456',
  specialty: 'exam',
  is_deleted: false
)

Teacher.create!(
  last_name: 'Bernard',
  first_name: 'Léon',
  email: 'leon@example.com',
  telephone_number: '00000000004',
  password: '123456',
  specialty: 'daily_conversation',
  is_deleted: false
)

Teacher.create!(
  last_name: 'Roux',
  first_name: 'Simon',
  email: 'simon@example.com',
  telephone_number: '00000000005',
  password: '123456',
  specialty: 'travel',
  is_deleted: false
)

Student.create!(
  last_name: 'Yamada',
  first_name: 'Tarou',
  email: 'yamada@example.com',
  telephone_number: '00000000000',
  password: '123456',
  is_deleted: false
)

Schedule.create!(
  teacher_id: 1,
  start_time: DateTime.new(2023, 9, 1, 9, 0, 0),
  finish_time: DateTime.new(2023, 9, 1, 10, 0, 0)
)

# 30 times do
#   lesson_start_time = Faker::Time.between(from: DateTime)