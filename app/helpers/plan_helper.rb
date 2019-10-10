module PlanHelper
  
  def unit_of_measure(unit)
    unit_map = {
      1 => "Days",
      2 => "Weeks",
      3 => "Months",
      4 => "Years"
    }
    
    unit_map[unit]
  end

  def calculate_plan(plan)
    unit = plan.unit.to_i
    if unit == 1
      plan.start + plan.length
    elsif unit == 2
      plan.start.weeks_since(plan.length)
    elsif unit == 3
      plan.start.months_since(plan.length)
    else
      plan.start.years_since(plan.length)
    end
  end
end
