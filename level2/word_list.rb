require 'net/http'

class WordList

  def initialize(url = "http://norvig.com/ngrams/word.list", words_list_file = "level2/words.list")
    @words_list_file = words_list_file
    import_words_list unless File.exists?(@words_list_file)
    @words_arr = File.open(@words_list_file).read.split("\n")
  end

  def length_filtered_list(n)
    @words_arr.select{ |word| word.length == n }
  end

  private

    def import_words_list(url = "http://norvig.com/ngrams/word.list")
      uri = URI(url)
      response = Net::HTTP.get(uri)
      File.open(@words_list_file,"w") do |f|
        f.write(response)
      end
    end
end
