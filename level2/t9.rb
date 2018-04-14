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
    possible_choices[@next_key_count]
  end

  def possible_choices(matching_length_words = WordList.new.length_filtered_list(@word_length))
    possible_combinations & matching_length_words
  end

  private

    def possible_letters
      @taps_sequence.collect{ |key_tap| KeyPadConvertor.to_letters(key_tap) }
    end

    def combine_arrays(arrays)
      return arrays.first if arrays.size == 1
      first_tap = arrays.shift
      first_tap
        .product(combine_arrays(arrays))
        .collect{ |arrays_products| arrays_products.join }
    end

    def possible_combinations
      combine_arrays(possible_letters)
    end
end
