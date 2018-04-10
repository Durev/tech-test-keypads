require_relative 'taps_count'

puts TapsCount.new(Word.new(STDIN.read.chomp)).sequence
