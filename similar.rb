require 'text'
require 'awesome_print'
require 'csv'


def similar?(word1 , word2)
		condition1 = Text::Levenshtein.distance(word1.gsub(/[aeiou]/ , "") , word2.gsub(/[aeiou]/ , "") ) <= 1
		condition2 = word1[0] == word2[0]
		condition3 = Text::Levenshtein.distance(word1 , word2 ) <= 2
		condition4 = Text::Metaphone.metaphone(word1) == Text::Metaphone.metaphone(word2)
		return (condition1 and condition2 and condition3 and condition4)
end


def get_groups(all_words)
	groups = {}

	"123456789abcdefghijklmnopqrstuvwxyz".split("").each{|x| eval("@A#{x} = [];"); puts "#{@A1}" }
	all_words.each{|word| puts word ; eval("@A#{word[0]} << word")}
	"123456789abcdefghijklmnopqrstuvwxyz".split("").each do |alphabet|
		var_array = eval "@A#{alphabet}"
		var_array.each do |word1|
			group = []
			groups["#{word1}"] = []
			groups["#{word1}"] << word1
			ap "#{alphabet} #{var_array.size}"
			var_array.each do |word2|
				if word1 != word2 and similar?(word1 , word2)
					# group << word2
					groups["#{word1}"] << word2
					var_array.delete(word2)
				end
			end
		end
	end
	ap groups

	# ------Bad implementation (takes lot of time)----------
	# all_words.each do |word1|
	# 	group = []
	# 	groups["#{word1}"] = []
	# 	groups["#{word1}"] << word1
	# 	ap all_words.size
	# 	all_words.each do |word2|
	# 		if word1 != word2 and similar?(word1 , word2)
	# 			# group << word2
	# 			groups["#{word1}"] << word2
	# 			all_words.delete(word2)
	# 		end
	# 	end
	# end
	# ap groups
	#reverse the groups
	#----------------------

	reverse_group_hash = {}
	groups.each do |key , value|
		value.each do |val|
			reverse_group_hash["#{val}"] = key
		end
	end
	ap reverse_group_hash
	return reverse_group_hash
end



all_words = []
CSV.foreach('hinglish_dictionary_alphabetically.csv') { |row| all_words << row[0]}
reverse_group_hash = get_groups(all_words)



CSV.open('grouped_dictionary_hash.csv', 'w') do |csv_object|
  reverse_group_hash.each do |key , value|
	csv_object << [key , value]
  end
end