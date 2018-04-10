class Word
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

  def initialize(word)
    @word = word
  end

  def get_taps(letter)
    KEY_PAD.each do |key, hash|
      return [key, hash.key(letter)] if hash.key(letter)
    end
  end

  def taps_count
    @word.split('').collect{ |letter| get_taps(letter) }
  end

  def sequence
    taps_count
      .collect { |key_tap| key_tap.first.to_s * key_tap.last }
      .join
  end
end

puts Word.new(STDIN.read.chomp).sequence
