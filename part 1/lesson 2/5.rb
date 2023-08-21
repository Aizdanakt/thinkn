def leap?(year)
  return true if year % 400 == 0
  return false if year % 100 == 0
  year % 4 == 0
end
print "Введите год "
year = gets.chomp.to_i
print "Введите номер месяца "
month = gets.chomp.to_i
print "Введите день месяца "
day = gets.chomp.to_i
total = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
total[1] = 29 if leap?(year)
result = total.take(month -1 ).sum + day
puts result
