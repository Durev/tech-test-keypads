require_relative 'key_pad_convertor'

class DigitsSequence

  def initialize(digits_sequence)
    @digits_sequence = digits_sequence
  end

  def word
    digits_chunks
      .map{ |digits_chunk| KeyPadConvertor.to_letter(digits_chunk) }
      .join
  end

  private

    def digits_chunks
      @digits_sequence
        .scan(/((\d)\2*)/)
        .map{ |chunk| chunk.first }
    end
end
