require_relative 'key_pad_convertor'

class Word

  def initialize(word)
    @word = word.split('')
  end

  def digits_sequence
    @word
      .map{ |letter| KeyPadConvertor.to_digits(letter) }
      .chunk_while{ |dig_before, dig_after| dig_before[0] == dig_after[0]} # Group similar consecutive digits
      .map{ |same_digits_groups| same_digits_groups.join(" ") } # Add spaces representing waiting for characters using the same key
      .join
  end
end
