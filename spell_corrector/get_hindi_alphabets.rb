# encoding: UTF-8

require 'awesome_print'
hash = Hash.new(0)
File.open("/home/harsh/spell_corrector/BigHindi.txt", "r") do |f|
  f.each_line do |line|
    words = line.split("")
    words.each{|w| w.chars.to_a.each{|c| hash[c] += 1 } }
  end
end

hindi_alphabets = hash.keys
