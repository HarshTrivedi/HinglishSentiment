require 'csv'

hash = {}

CSV.foreach('preprocessed_data.csv') do |row|
  line = row[0]
  line.gsub!(/[^A-Za-z0-9 ]/ , "")
  line.downcase!
  line.gsub!(/ +/ , " ")
  hash[line] = 1
end

# File.open("romanized_big_hindi.txt" , "r") do |file_r|
# 	file_r.each_line do |line|
# 	    line.gsub!(/[^A-Za-z0-9 ]/ , "")
# 	    line.downcase!
# 		line.gsub!(/ +/ , " ")
# 		if not line.empty?
# 		    hash[line] = 1
# 		end
# 	end
# end

CSV.open('hinglish_tagged.csv', 'w') do |csv_object|
  hash.to_a.each do |row_array|
    csv_object << row_array
  end
end