class Course < ApplicationRecord
  validates :name, presence: true

  has_many :student_courses
  has_many :students, through: :student_courses

  def self.sort_by_name
    order(:name)
  end
end
