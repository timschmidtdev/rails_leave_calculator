require 'rails_helper'

RSpec.describe Employee, type: :model do
  let(:user) { User.create!(name: "Leave User", email: "user@cool.com", password: "password")}
  let(:name) { RandomData.random_sentence }
  let(:employee) { Employee.create!(name: name, user: user) }

  it { is_expected.to have_many(:plans) }

  describe "attributes" do
    it "has name" do
      expect(employee).to have_attributes(name: name)
    end
  end
end
