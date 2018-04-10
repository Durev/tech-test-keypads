class Word

  def initialize(word)
    @word = word
  end

  def get_taps(letter)
    TapsCount::KEY_PAD.each do |key, hash|
      return [key, hash.key(letter)] if hash.key(letter)
    end
  end

  def taps_count
    @word.split('').collect{ |letter| get_taps(letter) }
  end
end
