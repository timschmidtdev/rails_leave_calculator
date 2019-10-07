class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      redirect_to @employee, notice: "Employee was saved successfully."
    else
      flash.now[:alert] = "Error creating employee. Please try again."
      render :new
    end
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])

    @employee.assign_attributes(empoyee_params)

    if @employee.save
      flash[:notice] = "Employee was updated."
      redirect_to @employee
    else
      flash.now[:alert] = "Error saving employee. Please try again."
      render :edit
    end
  end

  def destroy
    @employee = Employee.find(params[:id])

    if @employee.destroy
      flash[:notice] = "\"#{@employee.name}\" was deleted successfully."
      redirect_to action: :index
    else
      flash.now[:alert] = "There was an error deleting the employee."
      render :show
    end
  end

  private

  def employee_params
    params.require(:employee).permit(:name)
  end
end
