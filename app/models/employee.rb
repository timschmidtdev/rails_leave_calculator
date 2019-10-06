class Employee < ApplicationRecord
  has_many :plans, dependent: :destroy
end
