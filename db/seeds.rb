require 'random_data'

50.times do
  Plan.create!(
    plan_type:  RandomData.random_sentence,
    start:      RandomData.random_date,
    length:     RandomData.random_decimal,
    unit:       RandomData.random_sentence
  )
end
plans = Plan.all

puts "Seed finished"
puts "#{Plan.count} plans created"
