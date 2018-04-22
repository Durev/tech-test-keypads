require 'net/http'
require_relative 'key_pad_convertor'

class WordList

  WORDS_LIST_URL = "http://norvig.com/ngrams/word.list"
  WORDS_COUNT_URL = "http://norvig.com/ngrams/count_1w.txt"

  def initialize(words_list_path = "level3/words.list", words_count_path = "level3/words_count.txt")
    @words_list_path = words_list_path
    @words_count_path = words_count_path
    import_words_list unless File.exists?(@words_list_path)
    import_words_count unless File.exists?(@words_count_path)
  end

  def length_filtered_list(n)
    ordered_words_list.select{ |word| word.length == n }
  end

  def possible_words(n, taps_sequence)
    length_filtered_list(n).select{ |word| KeyPadConvertor.word_to_keys(word) == taps_sequence }
  end

  private

    def words_list
      File.open(@words_list_path).read.split("\n")
    end

    def ordered_words_list
      File.open(@words_count_path).read
        .split("\n")
        .map{ |str| str.match(/[a-z]{1,}/)[0] }
    end

    def import_words_list
      uri = URI(WORDS_LIST_URL)
      response = Net::HTTP.get(uri)
      File.open(@words_list_path,"w") do |f|
        f.write(response)
      end
    end

    def import_words_count
      uri = URI(WORDS_COUNT_URL)
        response = Net::HTTP.get(uri)
        File.open(@words_count_path,"w") do |f|
          f.write(response)
        end
    end
end
