require 'net/http'
require_relative 'key_pad_convertor'

class WordList

  WORDS_LIST_URL = "http://norvig.com/ngrams/word.list"
  MOST_USED_WORDS_LIST_URL = "http://norvig.com/ngrams/count_1w.txt"

  def initialize(words_list_path = "level3/words.list", most_used_words_list_path = "level3/words_count.txt")
    @words_list_path = words_list_path
    @most_used_words_list_path = most_used_words_list_path
    import_words_list unless File.exists?(@words_list_path)
    import_most_used_words_sorted_list unless File.exists?(@most_used_words_list_path)
  end

  def possible_words(n, taps_sequence)
    length_filtered_list(n).select{ |word| KeyPadConvertor.word_to_keys(word) == taps_sequence }
  end

  private

    attr_reader :words_list_path, :most_used_words_list_path

    def length_filtered_list(n)
      merged_words_lists.select{ |word| word.length == n }
    end

    def merged_words_lists
      (most_used_words_sorted_list + words_list).uniq
    end

    def words_list
      File.open(words_list_path).read.split("\n")
    end

    def most_used_words_sorted_list
      File.open(most_used_words_list_path).read
        .split("\n")
        .map{ |str| str.match(/[a-z]{1,}/)[0] }
    end

    def import_words_list
      uri = URI(WORDS_LIST_URL)
      response = Net::HTTP.get(uri)
      File.open(words_list_path,"w") do |f|
        f.write(response)
      end
    end

    def import_most_used_words_sorted_list
      uri = URI(MOST_USED_WORDS_LIST_URL)
        response = Net::HTTP.get(uri)
        File.open(most_used_words_list_path,"w") do |f|
          f.write(response)
        end
    end
end
