# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

StudentCourse.destroy_all
Student.destroy_all
Course.destroy_all

harry = Student.create!(name: 'Harry Potter', age: 14, house: 'Gryffindor')
draco = Student.create!(name: 'Draco Malfoy', age: 14, house: 'Slytherin')
cedric = Student.create!(name: 'Cedric Diggory', age: 16, house: 'Hufflepuff')
cho = Student.create!(name: 'Cho Chang', age: 14, house: 'Ravenclaw')

course1 = Course.create!(name: 'Charms')
course2 = Course.create!(name: 'Potions')
course3 = Course.create!(name: 'Herbology')

StudentCourse.create!(course: course1, student: harry)
StudentCourse.create!(course: course2, student: harry)
StudentCourse.create!(course: course3, student: draco)
StudentCourse.create!(course: course3, student: cedric)
StudentCourse.create!(course: course2, student: harry)
