class Student < ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true
  validates :house, presence: true

  has_many :student_courses
  has_many :courses, through: :student_courses

  def self.average_age
    self.average(:age).to_f
  end
end
