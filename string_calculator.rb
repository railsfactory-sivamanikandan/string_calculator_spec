module StringCalculator
 # To trigger the string manipulation
 def manipulate
  return 0 if empty?
  raise_if_negatives_present if include?("-")
  return digits.inject { |sum, x| sum +x }
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

end
