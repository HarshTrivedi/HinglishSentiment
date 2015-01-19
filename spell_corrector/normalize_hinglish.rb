require 'awesome_print'


def normalize_hinglish(word)

	word.downcase!

	#RULE : Baseline rule : trip down all the triples and double characters to single to reduce ambiguity.
	#Except o and e

	word.gsub!(/([^oe\W])(\1)+/ , '\1')
	word.gsub!(/([oe])(\1)+/ , '\1\1')

	#Remove the terminating “n”
	word.gsub!(/([aeiou])n$/ , '\1')

	#change all z’s to j’s
	word.gsub!(/z/ , 'j')

	#if there is multiple o’s, trip it down to u
	word.gsub!(/o{2,}/ , 'u')

	# to replace all “ee”’s to “i”	
	word.gsub!(/e{2,}/ , 'i')

	# replace all ‘c’ to ‘k’ unless it is not followed by ‘h’ and it is not already an english word (school != skhool)	
	word.gsub!(/ch/ , 'C')
	word.gsub!(/c/ , 'k')
	word.gsub!(/C/ , 'ch')

	#trip down all ‘sh’ to ‘s’ except the case that it is already an english word (eg: shy !-> sy)
	word.gsub!(/sh/ , 's')

	#change all terminating [“ey” , “ay” , “ye” , “ee..y” , “aa..y” , “ye..e”] -> single “e” 
	word.gsub!(/(e+y)|(a+y)|(ye+)$/ , 'e')

	#change all ph -> f
	word.gsub!(/ph/ , 'f')

	#reduce terminating: ‘ein’ to ‘e’
	word.gsub!(/ein/ , 'e')

	#change all “w”’s to “v”’s
	word.gsub!(/w/ , 'v')

	#Rule: “iya” -> “ia” AND terminating “(ny consonant)ya” -> (that consonant)ia
	word.gsub!(/iya/ , 'ia')
	word.gsub!(/([^aeiou])ya/ , '\1ia')

	return word
end



def get_probable_equivalents(word)
	word = normalize_hinglish(word)
	
end

@hindi_suffixes_in_english = [ "o","e", "ey" ,"u" ,"i", "ee","kr", "kar","ao","ie", "iey" , "iye" , "iyeh","ai", "aee","ae", "aey" , "aye","ne", "ney","ni", "nee" ,"na","te", "tey","iN", "ing","ti", "tee","ta","aN","oN","eN","akr" , "akar","aie" , "aiye","aiN","aya","egi", "egee","ega","ogi", "ogee","oge", "ogey","ane", "aney" ,"ana","ate", "atey" , "ate","ati", "atee","ata","tiN","aoN","aeN","uoN","ueN","uaN","aegi", "aegee" ,"aega","aogi", "aogee","aoge", "aoge" , "aogey","eNgi", "engee","eNge", "engey","uNgi", "ungee" , "oongi" , "oongee","unga", "oonga","atiN","naoN","naeN","taoN","taeN", "taey" , "taye","iyaN", "iyan" , "iya","iyoN", "iyo","iyaN", "aeNgi", "aengee","aeNge", "aenge" , "aengey","auNgi", "aoongi" , "aoongee" ,"auNga", "aoonga","aiyan" , "aiya","aiyon", "aiya" , "nay" , "ogay" , "anay" , "ay"].sort_by{|x| x.size}
#sort by size
@hindi_suffixes_in_english.reverse!


ap @hindi_suffixes_in_english

def hinglish_stemmer(word )

	#Reduce all triple occurences of alphabets to 2
	#Reduce all doubles to singles except:
	# oo ,ee 
	word.gsub!(/(o|O){2,}/ , "u")
	word.gsub!(/(e|E){2,}/ , "i")
	chars = word.chars.to_a
	chars.each_with_index{|c , i|  chars[i] = nil if chars[i] == chars[i+1]   }
	word = chars.compact.join


	rules_applied = {}

	# o	a
	from = "o" 	;	to = "a"
	if word.gsub(/o$/)
		word.gsub!(/o$/ , "a")
		rules_applied[from] = to
	end

	# ye,e,e+y , aye	a
# u	?
# i , ee	a
# kr , kar	?
# ao	a
# {dij}ie, {dij}iey , {dij}iye , {dij}iyeh	?
# ai , aee	a
# ae, aey 	a
# ne, ney , nay	?
# ni, nee	?
# na	?
# te, tey	?
# in, ing	?
# ti, tee	?
# ta	?
# an	?
# on	a
# en, ein	a
# akr , akar	?
# aie , aiye	a
# ain	?
# ai , aee	a
# egi, egee	?
# ega	?
# ogi, ogee	?
# oge, ogey , ogay	?
# ane, aney , anay	?
# ana	?
# ate, atey , ate	?
# ati, atee	?
# ata	?
# tin	?
# aon	?
# aen	?
# uon	?
# uen	?
# uan	?
# aegi, aegee	?
# aega	?
# aogi, aogee	a
# aoge, aoge , aogey	?
# engi, engee	?
# enge, engey	?
# ungi, ungee , oongi , oongee	a
# unga, oonga	?
# atin	?
# naon	?
# naen	?
# taon	?
# taen, taey , taye	?
# iyan , iya	?
# iyon, iyo	?
# iyan , iya	?
# aengi, aengee	?
# e{n}ge, e{n}gey	?
# {a}ungi, {a}oongi , {a}oongee	?
# aunga, aoonga	?
# {i,e,_}yan , {i,e,_}iya	?
# {i,e,_}yon, {i,e,_}yo	?









	@hindi_suffixes_in_english.each{ |suffix|
		if word.end_with?(suffix.downcase)  
			word.slice!( (word.size - suffix.size ) , (word.size - 1) )
			return word
		end
	}
	return word
end

