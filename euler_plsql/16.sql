answer = (2**1000).to_s.split('').map(&:to_i).reduce(:+)
 
puts answer
 
--output: 1366