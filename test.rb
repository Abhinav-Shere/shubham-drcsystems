def find_month_number(salary, x)
  cumulative_salary = 0
  month_number = 1

  loop do
    cumulative_salary += salary
    return month_number if cumulative_salary >= x

    month_number = (month_number % 12) + 1
  end
end

puts "Enter the number of queries: "
q = gets.chomp.to_i

q.times do
  puts "Enter salary and value: "
  s, x = gets.chomp.split.map(&:to_i)
  month_number = find_month_number(s, x)
  puts month_number
end
