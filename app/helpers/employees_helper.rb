module EmployeesHelper
  def user_is_authorized_for_employees?(employee)
    current_user && (employee_created_by_current_user?(employee) || current_user.admin?)
  end

  private

  def employee_created_by_current_user?(employee)
    employee.plans.any? { |plan| plan.user == current_user }  
  end
end
