let = "aeiouy".chars
hash = {}
let.each do |i|
  hash[i] = i.ord - 96
end
print hash
