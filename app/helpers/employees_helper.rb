module EmployeesHelper
  def user_is_authorized_for_employees?(employee)
    current_user && (current_user == employee.user || current_user.admin?)
  end

end
