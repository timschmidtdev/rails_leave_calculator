class Plan < ApplicationRecord
  belongs_to :employee
  belongs_to :user

  default_scope { order('created_at DESC') }

  validates :plan_type, length: { minimum: 3 }, presence: true
  validates :start, presence: true
  validates :length, presence: true
  validates :unit, presence: true
  validates :employee, presence: true
  validates :user, presence: true
end
