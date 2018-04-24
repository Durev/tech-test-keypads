require_relative 'word_list'
require_relative 'key_pad_convertor'

class WordLevel3

  def initialize(word)
    @word = word
  end

  def t9_sequence
    pressed_keys.join + next_key_taps
  end

  def pressed_keys
    KeyPadConvertor.word_to_keys(word)
  end

  private

    attr_reader :word

    def next_key_taps
      "1" * next_key_taps_count
    end

    def next_key_taps_count
      word_list.possible_words(word.length, pressed_keys).index(word)
    end

    def word_list
      WordList.new
    end
end
