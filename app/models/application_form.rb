class ApplicationForm < ApplicationRecord
  has_one :student

  validates_uniqueness_of :student_id
end
