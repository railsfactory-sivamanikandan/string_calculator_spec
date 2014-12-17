module StringCalculator
 # To trigger the string manipulation
 def manipulate
  return 0 if empty?
  raise_if_negatives_present if include?("-")
  return array_sum
 end
 # To set delimiter values
 def delimiter
   self[0..1] == "//" ? self[2] : ','
 end
 # To split the string in to number array
 def digits
   gsub(/\n/,delimiter).split(delimiter).map(&:to_i)
 end
 # To raise error if any negative number presents
 def raise_if_negatives_present
   negativies = digits.select{|x| x < 0}
   raise "Negativies not allowed:#{negativies.join(',')}" if negativies.any?
 end
 # To sum the array of numbers
 def array_sum
   sum = 0
   digits.each { |x| sum+=x if x < 1001 }
   sum
 end

end
