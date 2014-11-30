# encoding: utf-8
require 'emoji_data'
# t = File.read('/Users/nikitsaraf/HinglishSentiment/emoji_testing.csv', :encoding => "UTF-8").strip
# r = File.write('/Users/nikitsaraf/HinglishSentiment/new.csv', t, :encoding => "UTF-8")
# j = File.read('/Users/nikitsaraf/HinglishSentiment/new.csv').strip
EmojiData.scan("RT : Nonm ek fanm ka prend 😉 😉pié yo ansanm C LE BON! 😁 #CMS,3").each do |ec|
	puts "Found some #{ec.name}!"
end
