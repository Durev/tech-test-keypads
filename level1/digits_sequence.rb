require_relative 'key_pad_convertor'

class DigitsSequence

  def initialize(digits_sequence)
    @digits_sequence = digits_sequence
  end

  def word
    digits_chunks
      .collect{ |digits_chunk| KeyPadConvertor.to_letter(digits_chunk) }
      .join
  end

  private

    def digits_chunks
      @digits_sequence
        .scan(/((\d)\2*)/)
        .collect{ |chunk| chunk.first }
    end
end
