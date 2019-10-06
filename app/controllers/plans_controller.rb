class PlansController < ApplicationController
  def show
    @plan = Plan.find(params[:id])
  end

  def new
    @employee = Employee.find(params[:employee_id])
    @plan = Plan.new
  end

  def create
    @plan = Plan.new
    @plan.plan_type = params[:plan][:plan_type]
    @plan.start = params[:plan][:start]
    @plan.length = params[:plan][:length]
    @plan.unit = params[:plan][:unit]
    @employee = Employee.find(params[:employee_id])
    @plan.employee = @employee

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
    @plan.plan_type = params[:plan][:plan_type]
    @plan.start = params[:plan][:start]
    @plan.length = params[:plan][:length]
    @plan.unit = params[:plan][:unit]

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
end
