require 'rails_helper'

RSpec.describe Plan, type: :model do
  let(:plan) { Plan.create!(plan_type: "Parental Leave", start:20200903, length:182, unit:"days") }

  describe "attributes" do
    it "has type, start, length, and unit attributes" do
      expect(plan).to have_attributes(plan_type: "Parental Leave", start:20200903, length:182, unit:"days")
    end
  end
end
