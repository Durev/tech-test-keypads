require 'benchmark'
require_relative '../level3/word_list'
require_relative '../level1/word'
require_relative '../level1/digits_sequence'
require_relative '../level3/t9'
require_relative '../level3/word_level3'

words = WordList.new.most_common_words(100)

Benchmark.bm(12) do |x|

  x.report("multi-tap") do
    words.each do |word|
      taps = Word.new(word).digits_sequence
      DigitsSequence.new(taps).word
    end
  end

  x.report("t9") do
    words.each do |word|
      taps = WordLevel3.new(word).t9_sequence
      T9.new(taps).word
    end
  end

end
