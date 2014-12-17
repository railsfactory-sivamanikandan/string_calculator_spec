module StringCalculator
 # To trigger the string manipulation
 def manipulate
  return 0 if empty?
  return split(',').map(&:to_i).inject { |sum, x| sum +x }
 end
end
