class Student < ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true
  validates :house, presence: true

  has_many :student_courses
  has_many :courses, through: :student_courses

  def self.average_age
    average(:age).to_f
  end

  def self.sort_by_name
    order(:name)
  end
end
