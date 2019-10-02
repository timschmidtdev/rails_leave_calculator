require 'rails_helper'

RSpec.describe PlansController, type: :controller do
  let(:my_plan) { Plan.create!(plan_type: RandomData.random_sentence, start: RandomData.random_date, length: RandomData.random_decimal, unit: RandomData.random_word) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [my_plan] to @plans" do
      get :index

      expect(assigns(:plans)).to eq([my_plan])
    end
  end

  # describe "GET #show" do
  #   it "returns http success" do
  #     get :show
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET #new" do
  #   it "returns http success" do
  #     get :new
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET #edit" do
  #   it "returns http success" do
  #     get :edit
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
