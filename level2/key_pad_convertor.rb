class KeyPadConvertor

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

  def self.key_to_letter(key)
    KEY_PAD[key]
  end

  def self.letter_to_key(letter)
    KEY_PAD.select{ |key, letters| letters.include?(letter) }.keys.join.to_i
  end

  def self.word_to_keys(word)
    word.split('').map{ |letter| letter_to_key(letter) }
  end
end
