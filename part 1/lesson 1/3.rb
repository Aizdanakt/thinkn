
puts "Введите три стороны треугольника по очереди"
a = gets.to_i
b = gets.to_i
c = gets.to_i
total = [a, b, c].sort!

if total[0] == total[2]
  puts "Треугольник равносторонний"

elsif total.uniq.size == 2 && (total[2] ** 2) == (total[1]**2 + total[0]**2)
  puts "Треугольник равнобедренный и прямоугольный"

elsif total.uniq.size == 2
  puts "Треугольник равнобедренный"

elsif (total[2] ** 2) == (total[1]**2 + total[0]**2)
  puts "Треугольник прямоугольный"

else
  puts "Треугольник никакой."
end
