require 'random_data'

5.times do
  User.create!(
  name:     RandomData.random_name,
  email:    RandomData.random_email,
  password: RandomData.random_word
  )
end
users = User.all

15.times do
  Employee.create!(
    name: RandomData.random_sentence
  )
end
employees = Employee.all

50.times do
  Plan.create!(
    user:       users.sample,
    employee:   employees.sample,
    plan_type:  RandomData.random_sentence,
    start:      RandomData.random_date,
    length:     RandomData.random_decimal,
    unit:       RandomData.random_sentence
  )
end
plans = Plan.all

user = User.first
user.update_attributes!(
  email: 'schmidt.tim.j@gmail.com',
  password: 'helloworld'
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Employee.count} employees created"
puts "#{Plan.count} plans created"
