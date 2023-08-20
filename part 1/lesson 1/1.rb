print "Введите свое имя "
name = gets.chomp
print "Введите свой рост "
height = (gets.to_i - 110) * 1.15
if height > 0? print("#{name}, ваш идеальный вес - #{height}") : print("Ваш вес уже оптимальный")
end
