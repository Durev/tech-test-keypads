require_relative 'key_pad_convertor'

class Word

  def initialize(word)
    @word = word.split('')
  end

  def digits_sequence
    @word.map{ |letter| KeyPadConvertor.to_digits(letter) }.join
  end
end
