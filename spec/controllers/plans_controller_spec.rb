require 'rails_helper'

include SessionsHelper

RSpec.describe PlansController, type: :controller do
  let(:my_user) { User.create!(name: "Leave User", email: "user@cool.com", password: "password") }
  let(:my_employee) { Employee.create!(name: RandomData.random_sentence) }
  let(:my_plan) { my_employee.plans.create!(plan_type: RandomData.random_sentence,
                              start: RandomData.random_date,
                              length: RandomData.random_decimal,
                              unit: RandomData.random_word,
                              user: my_user) }

  context "guest user" do
    describe "GET show" do
      it "returns http redirect" do
        get :show, params: { employee_id: my_employee.id, id: my_plan.id }
        expect(response).to redirect_to(new_session_path)
      end
    end

    describe "GET new" do
      it "returns http redirect" do
        get :new, params: { employee_id: my_employee.id }
        expect(response).to redirect_to(new_session_path)
      end
    end

    describe "POST create" do
      it "returns http redirect" do
        post :create, params: { employee_id: my_employee.id, plan: {plan_type: RandomData.random_sentence, start: RandomData.random_date, length: RandomData.random_decimal, unit: RandomData.random_word } }
        expect(response).to redirect_to(new_session_path)
      end
    end

    describe "GET edit" do
      it "returns http redirect" do
        get :edit, params: { employee_id: my_employee.id, id: my_plan.id }
        expect(response).to redirect_to(new_session_path)
      end
    end

    describe "PUT update" do
      it "returns http redirect" do
        new_plan_type = RandomData.random_sentence
        new_start = RandomData.random_date
        new_length = RandomData.random_decimal
        new_unit = RandomData.random_word

        put :update, params: { employee_id: my_employee.id, id: my_plan.id, plan: { plan_type: new_plan_type, start: new_start, length: new_length, unit: new_unit } }
        expect(response).to redirect_to(new_session_path)
      end
    end

    describe "DELETE destroy" do
      it "returns http redirect" do
        delete :destroy, params: { employee_id: my_employee.id, id: my_plan.id }
        expect(response).to have_http_status(:redirect)
      end
    end
  end

  context "signed-in user" do
    before do
      create_session(my_user)
    end

    describe "GET new" do
      it "returns http success" do
        get :new, params: { employee_id: my_employee.id }
        expect(response).to have_http_status(:success)
      end

      it "renders the #new view" do
        get :new, params: { employee_id: my_employee.id }
        expect(response).to render_template :new
      end

      it "instantiates @plan" do
        get :new, params: { employee_id: my_employee.id }
        expect(assigns(:plan)).not_to be_nil
      end
    end

    describe "POST create" do
      it "increases the number of Plans by 1" do
        expect{ post :create, 
                      params: { 
                        employee_id: my_employee.id, 
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
                employee_id: my_employee.id, 
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
                employee_id: my_employee.id, 
                plan: {
                  plan_type: RandomData.random_sentence,
                  start: RandomData.random_date,
                  length: RandomData.random_decimal,
                  unit: RandomData.random_word
                }
              }
        expect(response).to redirect_to [my_employee, Plan.last]
      end
    end

    describe "GET show" do
      it "returns http success" do
        get :show, params: { employee_id: my_employee.id, id: my_plan.id }
        expect(response).to have_http_status(:success)
      end

      it "renders the #show view" do
        get :show, params: { employee_id: my_employee.id, id: my_plan.id }
        expect(response).to render_template :show
      end

      it "assigns my_plan to @plan" do
        get :show, params: { employee_id: my_employee.id, id: my_plan.id }
        expect(assigns(:plan)).to eq(my_plan)
      end
    end

    describe "GET edit" do
      it "returns http success" do
        get :edit, params: { employee_id: my_employee.id, id: my_plan.id }
        expect(response).to have_http_status(:success)
      end

      it "renders the #edit view" do
        get :edit, params: { employee_id: my_employee.id, id: my_plan.id }
        expect(response).to render_template :edit
      end

      it "assigns plan to be updated to @plan" do
        get :edit, params: { employee_id: my_employee.id, id: my_plan.id }
        plan_instance = assigns(:plan)
        expect(plan_instance.id).to eq my_plan.id
        expect(plan_instance.plan_type).to eq my_plan.plan_type
        expect(plan_instance.start).to eq my_plan.start
        expect(plan_instance.length).to eq my_plan.length
        expect(plan_instance.unit).to eq my_plan.unit
      end
    end

    describe "PUT update" do
      it "updates plan with expected attributes" do
        new_plan_type = RandomData.random_sentence
        new_start = RandomData.random_date
        new_length = RandomData.random_decimal
        new_unit = RandomData.random_word

        put :update, params: { 
                      employee_id: my_employee.id,
                      id: my_plan.id,
                      plan: { 
                        plan_type: new_plan_type,
                        start: new_start,
                        length: new_length,
                        unit: new_unit } }
        updated_plan = assigns(:plan)
        expect(updated_plan.id).to eq my_plan.id
        expect(updated_plan.plan_type).to eq new_plan_type
        expect(updated_plan.start).to eq new_start
        expect(updated_plan.length).to eq new_length
        expect(updated_plan.unit).to eq new_unit
      end

      it "redirects to the updated plan" do
        new_plan_type = RandomData.random_sentence
        new_start = RandomData.random_date
        new_length = RandomData.random_decimal
        new_unit = RandomData.random_word

        put :update, params: {
                      employee_id: my_employee.id,
                      id: my_plan.id,
                      plan: { 
                        plan_type: new_plan_type,
                        start: new_start,
                        length: new_length,
                        unit: new_unit  } }
        expect(response).to redirect_to [my_employee, my_plan]
      end
    end

    describe "DELETE destroy" do
      it "deletes the plan" do
        delete :destroy, params: { employee_id: my_employee.id, id: my_plan.id }
        count = Plan.where({id: my_plan.id}).size
        expect(count).to eq 0
      end

      it "redirects to plans index" do
        delete :destroy, params: { employee_id: my_employee.id, id: my_plan.id }
        expect(response).to redirect_to my_employee
      end
    end
  end
end
