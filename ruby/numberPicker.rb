n = rand(10)
loop do
  s = STDIN.gets.to_i
  break if s == n
  puts "Try Lower" if s > n
  puts "Try Higher" if s < n
end
puts "You got it!"
