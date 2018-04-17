require 'net/http'

class WordList

  def initialize(url = "http://norvig.com/ngrams/word.list", words_list_path = "level2/words.list")
    @words_list_path = words_list_path
    import_words_list unless File.exists?(@words_list_path)
    @words_arr = File.open(@words_list_path).read.split("\n")
  end

  def length_filtered_list(n)
    words_arr.select{ |word| word.length == n }
  end

  def possible_words(n, taps_sequence)
    length_filtered_list(n).select{ |word| KeyPadConvertor.word_to_keys(word) == taps_sequence }
  end

  private

  attr_reader :words_arr

    def import_words_list(url = "http://norvig.com/ngrams/word.list")
      uri = URI(url)
      response = Net::HTTP.get(uri)
      File.open(@words_list_path,"w") do |f|
        f.write(response)
      end
    end
end
