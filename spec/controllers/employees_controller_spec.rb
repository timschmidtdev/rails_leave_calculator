require 'rails_helper'
include SessionsHelper

RSpec.describe EmployeesController, type: :controller do
  let(:my_employee) { Employee.create!(name: RandomData.random_sentence) }

  # consider testing that guest can't see employees
  context "member user" do
    before do
      user = User.create!(name: "Leave User", email: "user@cool.com", password: "helloworld", role: :member)
      create_session(user)
    end

    describe "GET index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end

      it "assigns Employee.all to employee" do
        get :index
        expect(assigns(:employees)).to eq([my_employee])
      end
    end

    describe "GET show" do
      it "returns http success" do
        get :show, params: {id: my_employee.id}
        expect(response).to have_http_status(:success)
      end

      it "renders the #show view" do
        get :show, params: {id: my_employee.id}
        expect(response).to render_template :show
      end

      it "assigns my_employee to @employee" do
        get :show, params: {id: my_employee.id}
        expect(assigns(:employee)).to eq(my_employee)
      end
    end

    describe "GET new" do
      it "returns http redirect" do
        get :new
        expect(response).to redirect_to(employees_path)
      end
    end

    describe "POST create" do
      it "returns http redirect" do
        post :create, params: {employee: {name: RandomData.random_sentence}}
        expect(response).to redirect_to(employees_path)
      end
    end

    describe "GET edit" do
      it "returns http redirect" do
        get :edit, params: {id: my_employee.id}
        expect(response).to redirect_to(employees_path)
      end
    end

    describe "PUT update" do
      it "returns http redirect" do
        new_name = RandomData.random_sentence

        put :update, params: {id: my_employee.id, employee: {name: new_name}}
        expect(response).to redirect_to(employees_path)
      end
    end

    describe "DELETE destroy" do
      it "returns http redirect" do
        delete :destroy, params: {id: my_employee.id}
        expect(response).to redirect_to(employees_path)
      end
    end
  end

  context "admin user" do
    before do
      user = User.create!(name: "Leave User", email: "user@cool.com", password: "helloworld", role: :admin)
      create_session(user)
    end

    describe "GET index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end

      it "assigns Employee.all to employee" do
        get :index
        expect(assigns(:employees)).to eq([my_employee])
      end
    end

    describe "GET show" do
      it "returns http success" do
        get :show, params: {id: my_employee.id}
        expect(response).to have_http_status(:success)
      end

      it "renders the #show view" do
        get :show, params: {id: my_employee.id}
        expect(response).to render_template :show
      end

      it "assigns my_employee to @employee" do
        get :show, params: {id: my_employee.id}
        expect(assigns(:employee)).to eq(my_employee)
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

      it "initializes @employee" do
        get :new
        expect(assigns(:employee)).not_to be_nil
      end
    end

    describe "POST create" do
      it "increases the number of employees by 1" do
        expect{ post :create, params: {employee: {name: RandomData.random_sentence} } }.to change(Employee,:count).by(1)
      end

      it "assigns employee.last to @employee" do
        post :create, params: {employee: {name: RandomData.random_sentence}}
        expect(assigns(:employee)).to eq Employee.last
      end

      it "redirects to the new employee" do
        post :create, params: {employee: {name: RandomData.random_sentence}}
        expect(response).to redirect_to Employee.last
      end
    end

    describe "GET edit" do
      it "returns http success" do
        get :edit, params: {id: my_employee.id}
        expect(response).to have_http_status(:success)
      end

      it "renders the #edit view" do
        get :edit, params: {id: my_employee.id}
        expect(response).to render_template :edit
      end

      it "assigns employee to be updated to @employee" do
        get :edit, params: {id: my_employee.id}
        employee_instance = assigns(:employee)

        expect(employee_instance.id).to eq my_employee.id
        expect(employee_instance.name).to eq my_employee.name
      end
    end

    describe "PUT update" do
      it "updates employee with expected attributes" do
        new_name = RandomData.random_sentence

        put :update, params: {id: my_employee.id, employee: {name: new_name}}

        updated_employee = assigns(:employee)
        expect(updated_employee.id).to eq my_employee.id
        expect(updated_employee.name).to eq new_name
      end

      it "redirects to the updated employee" do
        new_name = RandomData.random_sentence

        put :update, params: {id: my_employee.id, employee: {name: new_name}}
        expect(response).to redirect_to my_employee
      end
    end

    describe "DELETE destroy" do
      it "deletes the employee" do
        delete :destroy, params: {id: my_employee.id}
        count = Plan.where({id: my_employee.id}).size
        expect(count).to eq 0
      end

      it "redirects to employees index" do
        delete :destroy, params: {id: my_employee.id}
        expect(response).to redirect_to employees_path
      end
    end
  end
end
