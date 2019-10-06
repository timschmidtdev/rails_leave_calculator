require 'random_data'

15.times do
  Employee.create!(
    name: RandomData.random_sentence
  )
end
employees = Employee.all

50.times do
  Plan.create!(
    employee:   employees.sample,
    plan_type:  RandomData.random_sentence,
    start:      RandomData.random_date,
    length:     RandomData.random_decimal,
    unit:       RandomData.random_sentence
  )
end
plans = Plan.all

puts "Seed finished"
puts "#{Employee.count} employees created"
puts "#{Plan.count} plans created"
