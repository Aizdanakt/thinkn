array = (10..100).to_a.select {|i| i.to_s[-1] != "5"}
puts array
