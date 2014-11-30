
require 'csv'


updated_csv_arrays = []

CSV.foreach('initial_data.csv') do |row|
	tweet = row[0]
	label = row[1]
	updated_tweet = tweet.gsub(/(@\w+)|(http:\/\/t.co\/\w*)/ , "" )
	updated_csv_arrays << [ updated_tweet , row[1].to_i ]
	puts "---start---"
	puts tweet
	puts "---"
	puts updated_tweet
	puts "---end---"
	puts ""
end



CSV.open('preprocessed_data.csv', 'w') do |csv_object|
  updated_csv_arrays.each do |row_array|
    csv_object << row_array
  end
end
