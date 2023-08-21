hash = {}

loop do
  print "Введите название товара "
  product = gets.chomp

  break if product == "стоп"
  print "Введите цену за товар "
  price = gets.chomp
  print "Введите количество товара "
  count = gets.chomp

  hash[product] = {price => count}

end
puts hash.each { |key, value| puts("#{key} - #{value.keys[0].to_f * value.values[0].to_f}") }
puts "Итого - #{hash.values.reduce(0) {|sum, (k, v)| sum + (k.keys[0].to_f * k.values[0].to_f)}}"
