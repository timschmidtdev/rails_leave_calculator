class AddEmployeeToPlans < ActiveRecord::Migration[6.0]
  def change
    add_column :plans, :employee_id, :integer
    add_index :plans, :employee_id
  end
end
