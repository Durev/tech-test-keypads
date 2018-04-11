class T9ToWord

  attr_reader :next_key_count

  KEY_PAD = {
    2 => { 1 => "a", 2 => "b", 3 => "c" },
    3 => { 1 => "d", 2 => "e", 3 => "f" },
    4 => { 1 => "g", 2 => "h", 3 => "i" },
    5 => { 1 => "j", 2 => "k", 3 => "l" },
    6 => { 1 => "m", 2 => "n", 3 => "o" },
    7 => { 1 => "p", 2 => "q", 3 => "r", 4 => "s" },
    8 => { 1 => "t", 2 => "u", 3 => "v" },
    9 => { 1 => "w", 2 => "x", 3 => "y", 4 => "z" },
    0 => { 1 => " " }
  }

  def initialize(taps_sequence)
    taps_array = taps_sequence.split('')
    @next_key_count = taps_array.count{ |key| key == "1" }
    @taps_sequence = taps_array.collect{ |key| key.to_i }.reject{ |key| key == 1}
  end

  def possible_letters
    @taps_sequence.collect{ |key_tap| KEY_PAD[key_tap].values }
  end

  def possible_combinations
    combine_arrays(possible_letters)
  end

  private

    def combine_arrays(arrays)
      return arrays.first if arrays.size == 1
      first_tap = arrays.shift
      first_tap
        .product(combine_arrays(arrays))
        .collect{ |arrays_products| arrays_products.join }
    end
end



p T9ToWord.new(STDIN.read.chomp).possible_combinations

