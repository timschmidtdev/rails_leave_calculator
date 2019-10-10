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
    start = plan.start
    unit = plan.unit.to_i
    length = plan.length
    
    if unit == 1
      start + plan.length
    elsif unit == 2
      start.weeks_since(length)
    elsif unit == 3
      start.months_since(length)
    else
      start.years_since(length)
    end
  end
end
