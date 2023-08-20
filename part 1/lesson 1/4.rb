puts "Введите три коэффициента по очереди"
a = gets.to_i
b = gets.to_i
c = gets.to_i
d = (b**2) - (4 * a * c)
if d < 0
  puts "Дискриминант равен #{d}, корней нет"
elsif d == 0
  puts "Дискриминант равен #{d}, x = #{(-1 * b) / ( 2 * a )} "
else
  puts "Дискриминант равен #{d}, x1 = #{((-1 * b) + Math.sqrt(d)) / (2 * a)}, x2 = #{((-1 * b) - Math.sqrt(d)) / (2 * a)}"
end