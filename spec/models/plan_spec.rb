require 'rails_helper'

RSpec.describe Plan, type: :model do
  let(:name) { RandomData.random_sentence }
  let(:plan_type) { RandomData.random_sentence }
  let(:date) { RandomData.random_date }
  let(:length) { RandomData.random_decimal }
  let(:unit) { RandomData.random_word}

  let(:employee) { Employee.create!(name: name) }
  let(:user) { User.create!(name: "Leave User", email: "user@cool.com", password: "password") }
  let(:plan) { employee.plans.create!(plan_type: plan_type, start: date, length: length, unit: unit, user: user) }

  it { is_expected.to belong_to(:employee) }
  it { is_expected.to belong_to(:user) }

  it { is_expected.to validate_presence_of(:plan_type) }
  it { is_expected.to validate_presence_of(:start) }
  it { is_expected.to validate_presence_of(:length) }
  it { is_expected.to validate_presence_of(:unit) }
  it { is_expected.to validate_presence_of(:employee) }
  it { is_expected.to validate_presence_of(:user) }

  it { is_expected.to validate_length_of(:plan_type).is_at_least(3) }

  describe "attributes" do
    it "has type, start, length, unit, and user attributes" do
      expect(plan).to have_attributes(plan_type: plan_type, start: date, length: length, unit: unit, user: user)
    end
  end
end
