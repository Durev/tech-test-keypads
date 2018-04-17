require_relative 'word_list'
require_relative 'key_pad_convertor'

class T9

  def initialize(taps_sequence)
    taps_array = taps_sequence.split('')
    @next_key_count = taps_array.count{ |key| key == "1" }
    @taps_sequence = taps_array.collect{ |key| key.to_i }.reject{ |key| key == 1}
    @word_length = @taps_sequence.size
  end

  def word
    WordList.new.possible_words(word_length, taps_sequence)[next_key_count]
  end

  private

    attr_reader :word_length, :taps_sequence, :next_key_count
end
