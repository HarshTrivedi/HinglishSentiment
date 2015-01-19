# encoding: UTF-8
require 'awesome_print'
def words text
  text.downcase.scan(/[a-z]+/)
end

def train features
  model = Hash.new(1)
  features.each {|f| model[f] += 1 }
  return model
end

# @nwords = train(words(File.new('holmes.txt').read))
# @letters = ("a".."z").to_a.join

@nwords = train(words(File.new('romanized_big_hindi.txt').read))
# @letters = ['क','ख','ग','घ','ङ','च','छ','ज ','झ','ञ','ट','ठ','ड','ढ','ण','त','थ','द','ध','न','प','फ','ब','भ','म','य','र','ल','व','श','ष','स','ह','अ','आ','इ','ई','उ','ऊ','ए','ऐ','ओ','औ','ऋ','ॠ','ऌ','ॡ','अं','अः','अँ','क़','ख़','ग़','ज़','फ़','ड़','ढ़','क्ष','त्र','ज्ञ','श्र' ]
@letters = ("a".."z").to_a.join
# hash = Hash.new(0)
# File.open("/home/harsh/spell_corrector/BigHindi.txt", "r") do |f|
#   f.each_line do |line|
#     words = line.split("")
#     words.each{|w| w.chars.to_a.each{|c| hash[c] += 1 } }
#   end
# end

# hindi_alphabets = hash.keys
# @letters = hindi_alphabets

def edits1 word
  n = word.length
  deletion = (0...n).collect {|i| word[0...i]+word[i+1..-1] }
  transposition = (0...n-1).collect {|i| word[0...i]+word[i+1,1]+word[i,1]+word[i+2..-1] }
  alteration = []
  n.times {|i| @letters.each_byte{|l| alteration << word[0...i]+l.chr+word[i+1..-1] } }
  insertion = []
  (n+1).times {|i| @letters.each_byte{|l| insertion << word[0...i]+l.chr+word[i..-1] } }
  result = deletion + transposition + alteration + insertion
  result.empty? ? nil : result
end

def known_edits2 word
  result = []
  edits1(word).each {|e1| edits1(e1).each {|e2| result << e2 if @nwords.has_key?(e2) }}
  result.empty? ? nil : result
end

def known words
  result = words.find_all {|w| @nwords.has_key?(w) }
  result.empty? ? nil : result
end

def correct word
  (known([word]) or known(edits1(word)) or known_edits2(word) or [word]).max {|a,b| @nwords[a] <=> @nwords[b] }
end
