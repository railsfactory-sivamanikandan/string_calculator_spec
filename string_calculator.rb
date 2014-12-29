module StringCalculator
  # To manipulate the integer from the string as per the tdd-kata (http://osherove.com/tdd-kata-1/)
 def manipulate
  return 0 if empty?
  raise_if_negatives_present if include?("-")
  return array_sum
 end

 def delimiter
   ','
 end

 def digits
   gsub(regular_expression,delimiter).split(delimiter).reject(&:empty?).map(&:to_i)
 end

 def raise_if_negatives_present
   negativies = digits.select{|x| x < 0}
   raise "Negativies not allowed:#{negativies.join(',')}" if negativies.any?
 end

 def array_sum
   sum = 0
   digits.each { |x| sum+=x if x < 1001 }
   sum
 end

 def regular_expression
  /[\n`~!@#$%^&*()_|+\=?;:'",.<>\{\}\[\]\\\/]/
 end
end
