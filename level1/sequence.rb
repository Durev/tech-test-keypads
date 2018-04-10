class Sequence

  def initialize(taps_sequence)
    @taps_sequence = taps_sequence.split('')
  end

  def taps_count
    @taps_sequence
      .chunk{ |digit| digit }
      .collect { |digit, arr| [digit.to_i, arr.length] unless digit.strip.empty? } # Count successive taps unless it's a waiting space
      .compact
  end
end
