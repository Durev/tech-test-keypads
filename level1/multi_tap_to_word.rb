
class Sequence

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
    @taps_sequence = taps_sequence.split('')
  end

  def taps_count
    @taps_sequence
      .chunk{ |digit| digit }
      .collect { |digit, arr| [digit.to_i, arr.length] unless digit.strip.empty? } # Count successive taps unless it's a waiting space
      .compact
  end

  def word
     p taps_count
      .collect{ |pair| KEY_PAD[pair.first][pair.last] }
      .join
  end
end

Sequence.new(STDIN.read.chomp).word
