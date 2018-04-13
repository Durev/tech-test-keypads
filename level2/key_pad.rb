class KeyPad

  KEY_PAD = {
    2 => ["a", "b", "c"],
    3 => ["d", "e", "f"],
    4 => ["g", "h", "i"],
    5 => ["j", "k", "l"],
    6 => ["m", "n", "o"],
    7 => ["p", "q", "r", "s"],
    8 => ["t", "u", "v"],
    9 => ["w", "x", "y", "z"]
  }

  # attr_reader :key, :letter

  def self.to_letters(key)
    KEY_PAD[key]
  end

  def self.to_key(letter)
    KEY_PAD.select{ |key, letters| letters.include?(letter) }.keys.join
  end
end
