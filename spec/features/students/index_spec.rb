require 'rails_helper'

RSpec.describe 'student index page' do
  it 'can list all students with their name, age, and house' do
    harry = Student.create!(name: 'Harry Potter', age: 14, house: 'Gryffindor')
    draco = Student.create!(name: 'Draco Malfoy', age: 14, house: 'Slytherin')
    cedric = Student.create!(name: 'Cedric Diggory', age: 16, house: 'Hufflepuff')
    cho = Student.create!(name: 'Cho Chang', age: 14, house: 'Ravenclaw')

    visit '/students'

    within "#student-#{harry.id}" do
      expect(page).to have_content(harry.name)
      expect(page).to have_content(harry.age)
      expect(page).to have_content(harry.house)
    end
    # test with keywords are typically capybara search keywords: within, visit, expect, have_content, .to, should_have, through

    within "#student-#{draco.id}" do
      expect(page).to have_content(draco.name)
      expect(page).to have_content(draco.age)
      expect(page).to have_content(draco.house)
    end

    within "#student-#{cedric.id}" do
      expect(page).to have_content(cedric.name)
      expect(page).to have_content(cedric.age)
      expect(page).to have_content(cedric.house)
    end

    within "#student-#{cho.id}" do
      expect(page).to have_content(cho.name)
      expect(page).to have_content(cho.age)
      expect(page).to have_content(cho.house)
    end
  end

  it 'can list the average age of all students' do
    harry = Student.create!(name: 'Harry Potter', age: 14, house: 'Gryffindor')
    draco = Student.create!(name: 'Draco Malfoy', age: 14, house: 'Slytherin')
    cedric = Student.create!(name: 'Cedric Diggory', age: 16, house: 'Hufflepuff')
    cho = Student.create!(name: 'Cho Chang', age: 14, house: 'Ravenclaw')

    visit '/students'

    expect(page).to have_content("Average Age: 14.5")
  end

end
