require_relative 'taps_count'

puts TapsCount.new(Sequence.new(STDIN.read.chomp)).word
