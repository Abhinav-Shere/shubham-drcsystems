def find_month_number(salary, x)
  cumulative_salary = 0
  month_number = 1

  loop do
    cumulative_salary += salary
    return month_number if cumulative_salary >= x

    month_number = (month_number % 12) + 1
  end
end

# Read the number of queries (Q) from the input
puts "Enter the number of queries: "
q = gets.chomp.to_i

# Process each query
q.times do
  # Read salary (S) and value (X) from the input
  puts "Enter salary and value: "
  s, x = gets.chomp.split.map(&:to_i)

  # Find the corresponding month number for the given value
  month_number = find_month_number(s, x)

  # Print the result for this query
  puts month_number
end
