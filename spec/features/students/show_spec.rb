require 'rails_helper'

RSpec.describe 'student show page' do
  it "can list the student's courses" do
    course1 = Course.create!(name: 'Charms')
    course2 = Course.create!(name: 'Potions')
    course3 = Course.create!(name: 'Herbology')

    student = Student.create!(name: 'Harry Potter', age: 14, house: 'Gryffindor')

    StudentCourse.create!(course: course1, student: student)
    StudentCourse.create!(course: course2, student: student)

    visit "/students/#{student.id}"

    expect(page).to have_content(student.name)
    expect(page).to have_content(course1.name)
    expect(page).to have_content(course2.name)
    expect(page).to_not have_content(course3.name)
  end
end
