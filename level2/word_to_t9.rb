require_relative 'word'

puts Word.new(STDIN.read.chomp).t9_sequence
