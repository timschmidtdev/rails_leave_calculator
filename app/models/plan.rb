class Plan < ApplicationRecord
  belongs_to :employee

  validates :plan_type, length: { minimum: 3 }, presence: true
  validates :start, presence: true
  validates :length, presence: true
  validates :unit, presence: true
  validates :employee, presence: true
end
