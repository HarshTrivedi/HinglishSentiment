require 'csv'


hash = {}
File.open("english.txt" , "r") do |file_r|
	file_r.each_line do |line|
	    line.gsub!(/[^A-Za-z0-9 ]/ , "")
	    line.downcase!
		line.gsub!(/ +/ , " ")
		if not line.empty?
		    hash[line] = 0
		end
	end
end

CSV.open('english_tagged.csv', 'w') do |csv_object|
  hash.to_a.each do |row_array|
    csv_object << row_array
  end
end



