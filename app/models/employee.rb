class Employee < ApplicationRecord
  belongs_to :user
  has_many :plans, dependent: :destroy

  validates :user, presence: true
end
