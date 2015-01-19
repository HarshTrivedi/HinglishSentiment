require 'awesome_print'
require 'csv'
def generate_random_word
	alphabets = []
	rand(2..8).times do  
		vowels = ["a" , "e" , "i" , "o" , "u" ]
		consonants = ("a".."z").to_a - ["a" , "e" , "i" , "o" , "u" ]
		alphabets << [vowels , consonants].sample.sample  
	end
	return alphabets.join
end

def generate_random_line
	words = []
	rand(5..20).times do
		words << generate_random_word
	end
	words.join(" ")
end

hash = {}
10000.times do
	hash[generate_random_line] = 2
end

CSV.open('random_text_tagged.csv', 'w') do |csv_object|
  hash.to_a.each do |row_array|
    csv_object << row_array
  end
end