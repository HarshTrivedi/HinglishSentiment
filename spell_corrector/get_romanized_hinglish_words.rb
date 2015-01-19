# encoding: UTF-8

require 'awesome_print'
hash = Hash.new(0)
File.open("/home/harsh/spell_corrector/romanized_big_hindi.txt", "r") do |f|
  f.each_line do |line|
    words = line.split(" ")
    words.each{|w| hash[w] += 1 }
  end
end

ap hash