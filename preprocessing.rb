
require 'csv'
require 'emoji_data'

updated_csv_arrays = []
positive_emotions = "v grinning grin joy smiley smile clap smile_cat purple_heart green_heart blue_heart gift_heart raised_hands crown two_hearts heart dancer ok_hand relaxed star2 +1 joy_cat smiley_cat sweat_smile laughing wink blush yum hearts heart_eyes sunglasses kissing kissing_heart kissing_closed_eyes stuck_out_tongue stuck_out_tongue_winking_eye stuck_out_tongue_closed_eyes grimacing".split(" ")
negative_emotions = "cold_sweat scream astonished flushed smirk expressionless unamused broken_heart sweat pensive confused disappointed worried angry cry persevere disappointed_relieved frowning anguished fearful weary tired_face sob".split(" ")
CSV.foreach('finalData_1626.csv') do |row|
	if not( row[0].nil? or row[1].nil? or row[1].strip.empty? )
		tweet = row[0]
		label = row[1]
		updated_tweet = tweet.gsub(/(@\w+)|(http:\/\/t.co\/\w*)/ , "" )
		pos_degree = 0
		neg_degree = 0
		total_emotions = 0
		EmojiData.scan(updated_tweet).each do |ec|
			puts "#{ec} #{ec.short_name}"			
			pos_degree+=1 if positive_emotions.include?(ec.short_name)
			neg_degree+=1 if negative_emotions.include?(ec.short_name)
			total_emotions+=1
		end
		count = tweet.gsub(/(:[P)pD])|(:-[PD)])|(;-\))|(;[)pP])|(\^_\^)/).to_a.count
		pos_degree += count
		total_emotions += count

		count += tweet.gsub(/(:[\/\\(])|(:['-]\()|(-_-)/).to_a.count
		neg_degree += count
		total_emotions += count
		
		pos_emot_exists = (pos_degree > 0) ? 1 : 0
		neg_emot_exists = (neg_degree > 0) ? 1 : 0
		unknown_emot_exists = ( (total_emotions -pos_degree -neg_degree ) > 0 ) ? 1 : 0

		happy_expression = tweet.gsub(/(([hH]+[Aae]+){2,})|([lL]+[oO0]+[lL]+)/).to_a.size

		updated_csv_arrays << [ updated_tweet , row[1].to_i , pos_degree , neg_degree , total_emotions - pos_degree - neg_degree  , happy_expression]
	end
end

CSV.open('preprocessed_data.csv', 'w') do |csv_object|
  updated_csv_arrays.each do |row_array|
    csv_object << row_array
  end
end
