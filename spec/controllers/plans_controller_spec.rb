require 'rails_helper'

RSpec.describe PlansController, type: :controller do
  let(:my_plan) { Plan.create!(plan_type: RandomData.random_sentence,
                              start: RandomData.random_date,
                              length: RandomData.random_decimal,
                              unit: RandomData.random_word) }

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

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end

    it "instantiates @plan" do
      get :new
      expect(assigns(:plan)).not_to be_nil
    end
  end

  describe "POST create" do
    it "increases the number of Plans by 1" do
      expect{ post :create, 
                    params: { 
                      plan: { 
                        plan_type: RandomData.random_sentence,
                        start: RandomData.random_date,
                        length: RandomData.random_decimal,
                        unit: RandomData.random_word
                      }
                    }
                  }.to change(Plan,:count).by(1)
    end

    it "assigns the new plan to @plan" do
      post :create, 
            params: {
              plan: {
                plan_type: RandomData.random_sentence,
                start: RandomData.random_date,
                length: RandomData.random_decimal,
                unit: RandomData.random_word
              }
            }
      expect(assigns(:plan)).to eq Plan.last
    end

    it "redirects to the new plan" do
      post :create,
            params: {
              plan: {
                plan_type: RandomData.random_sentence,
                start: RandomData.random_date,
                length: RandomData.random_decimal,
                unit: RandomData.random_word
              }
            }
      expect(response).to redirect_to Plan.last
    end
  end

  describe "GET show" do
    it "returns http success" do
      get :show, params: {id: my_plan.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, params: {id: my_plan.id}
      expect(response).to render_template :show
    end

    it "assigns my_plan to @plan" do
      get :show, params: {id: my_plan.id}
      expect(assigns(:plan)).to eq(my_plan)
    end
  end
end
