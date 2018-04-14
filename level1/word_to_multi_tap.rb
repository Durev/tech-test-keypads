require_relative 'word'

puts Word.new(STDIN.read.chomp).digits_sequence
