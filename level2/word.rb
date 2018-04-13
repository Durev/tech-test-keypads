require_relative 'word_list'
require_relative 'key_pad'
require_relative 't9'

class Word

  def initialize(word)
    @word = word
    @letters = word.split('')
  end

  def pressed_keys
    @letters
      .collect{ |letter| KeyPad.to_key(letter) }
      .join
  end

  def next_key_taps
    next_key_taps_count = T9.new(pressed_keys).possible_choices.index(@word)
    "1" * next_key_taps_count
  end

  def t9_sequence
    pressed_keys + next_key_taps
  end
end
