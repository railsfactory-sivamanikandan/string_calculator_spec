module StringCalculator
 # To trigger the string manipulation
 def manipulate
  return 0 if empty?
  return gsub(/\n/,delimiter).split(delimiter).map(&:to_i).inject { |sum, x| sum +x }
 end
 # To set delimiter values
 def delimiter
   self[0..1] == "//" ? self[2] : ','
 end

end
