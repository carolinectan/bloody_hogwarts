require 'rails_helper'

RSpec.describe 'courses index page' do
  it 'can list courses and the number of studens enrolled in each course' do
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

    visit '/courses'

    expect(page).to have_content("All Courses")

    within "#course-#{course1.id}" do
      expect(page).to have_content(course1.name)
      expect(page).to have_content(course1.students.length)
      expect(page).to have_content("Charms: 1")
    end

    within "#course-#{course2.id}" do
      expect(page).to have_content(course2.name)
      expect(page).to have_content(course2.students.length)
      expect(page).to have_content("Potions: 2")
    end

    within "#course-#{course3.id}" do
      expect(page).to have_content(course3.name)
      expect(page).to have_content(course3.students.length)
      expect(page).to have_content("Herbology: 2")
    end
  end
end
