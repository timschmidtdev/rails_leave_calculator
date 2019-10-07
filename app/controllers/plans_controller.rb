class PlansController < ApplicationController
  before_action :require_sign_in, except: :show

  def show
    @plan = Plan.find(params[:id])
  end

  def new
    @employee = Employee.find(params[:employee_id])
    @plan = Plan.new
  end

  def create
    @employee = Employee.find(params[:employee_id])
    @plan = @employee.plans.build(plan_params)
    @plan.user = current_user

    if @plan.save
      flash[:notice] = "Plan was saved."
      redirect_to [@employee, @plan]
    else
      flash.now[:alert] = "There was an error saving the plan. Please try again."
      render :new
    end
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    @plan = Plan.find(params[:id])
    @plan.assign_attributes(plan_params)

    if @plan.save
      flash[:notice] = "Plan was updated."
      redirect_to [@plan.employee, @plan]
    else
      flash.now[:alert] = "There was an error saving the plan. Please try again."
      render :edit
    end
  end

  def destroy
    @plan = Plan.find(params[:id])

    if @plan.destroy
      flash[:notice] = "\"#{@plan.plan_type}\" was deleted successfully."
      redirect_to @plan.employee
    else
      flash.now[:alert] = "There was an error deleting the plan."
      render :show
    end
  end

  private

  def plan_params
    params.require(:plan).permit(:plan_type, :start, :length, :unit)
  end
end
