# encoding: utf-8
require 'unidecoder'
require 'awesome_print'

# hindi_suffixes = ["ो", "े", "ू", "ु", "ी", "ि", "ा", "कर", "ाओ", "िए", "ाई", "ाए", "ने", "नी", "ना", "ते", "ीं", "ती", "ता", "ाँ", "ां", "ों", "ें" , "ाकर", "ाइए", "ाईं", "ाया", "ेगी", "ेगा", "ोगी", "ोगे", "ाने", "ाना", "ाते", "ाती", "ाता", "तीं", "ाओं", "ाएं", "ुओं", "ुएं", "ुआं" ,"ाएगी", "ाएगा", "ाओगी", "ाओगे", "एंगी", "ेंगी", "एंगे", "ेंगे", "ूंगी", "ूंगा", "ातीं", "नाओं", "नाएं", "ताओं", "ताएं", "ियाँ", "ियों", "ियां" , "ाएंगी", "ाएंगे", "ाऊंगी", "ाऊंगा", "ाइयाँ", "ाइयों", "ाइयां"]
# @hindi_suffixes_in_english = []
# hindi_suffixes.each{|suffix| @hindi_suffixes_in_english << suffix.to_ascii }



# @hindi_suffixes_in_english.reverse!
# ap @hindi_suffixes_in_english

# [
#     [ 0] "ो",
#     [ 1] "े",
#     [ 2] "ू",
#     [ 3] "ु",
#     [ 4] "ी",
#     [ 5] "ि",
#     [ 6] "ा",
#     [ 7] "कर",
#     [ 8] "ाओ",
#     [ 9] "िए",
#     [10] "ाई",
#     [11] "ाए",
#     [12] "ने",
#     [13] "नी",
#     [14] "ना",
#     [15] "ते",
#     [16] "ीं",
#     [17] "ती",
#     [18] "ता",
#     [19] "ाँ",
#     [20] "ां",
#     [21] "ों",
#     [22] "ें",
#     [23] "ाकर",
#     [24] "ाइए",
#     [25] "ाईं",
#     [26] "ाया",
#     [27] "ेगी",
#     [28] "ेगा",
#     [29] "ोगी",
#     [30] "ोगे",
#     [31] "ाने",
#     [32] "ाना",
#     [33] "ाते",
#     [34] "ाती",
#     [35] "ाता",
#     [36] "तीं",
#     [37] "ाओं",
#     [38] "ाएं",
#     [39] "ुओं",
#     [40] "ुएं",
#     [41] "ुआं",
#     [42] "ाएगी",
#     [43] "ाएगा",
#     [44] "ाओगी",
#     [45] "ाओगे",
#     [46] "एंगी",
#     [47] "ेंगी",
#     [48] "एंगे",
#     [49] "ेंगे",
#     [50] "ूंगी",
#     [51] "ूंगा",
#     [52] "ातीं",
#     [53] "नाओं",
#     [54] "नाएं",
#     [55] "ताओं",
#     [56] "ताएं",
#     [57] "ियाँ",
#     [58] "ियों",
#     [59] "ियां",
#     [60] "ाएंगी",
#     [61] "ाएंगे",
#     [62] "ाऊंगी",
#     [63] "ाऊंगा",
#     [64] "ाइयाँ",
#     [65] "ाइयों",
#     [66] "ाइयां"
# ]



# [
#     [ 0] "o",
#     [ 1] "e",	#ey
#     [ 2] "uu", #oo
#     [ 3] "u", 
#     [ 4] "ii", #ee
#     [ 5] "i", 
#     [ 6] "aa", #a
#     [ 7] "kr", #kar
#     [ 8] "aao", 
#     [ 9] "ie", #iey , iye , iyeh
#     [10] "aaii", #aii , aee
#     [11] "aae", #aaey , aye
#     [12] "ne", #ney
#     [13] "nii", #nee , ni
#     [14] "naa", #na
#     [15] "te", #tey
#     [16] "iiN", #iing
#     [17] "tii", #tee
#     [18] "taa", #ta
#     [19] "aaN", #an
#     [20] "aaN",
#     [21] "oN",
#     [22] "eN",
#     [23] "aakr", #akr , aakar , akar
#     [24] "aaie", #aie , aiye
#     [25] "aaiiN", aiin , aain
#     [26] "aayaa", ayaa , aya , aaya
#     [27] "egii", #egee
#     [28] "egaa", ega
#     [29] "ogii", #ogee
#     [30] "oge", #ogey
#     [31] "aane", #aaney , aney
#     [32] "aanaa", #anaa , aana , ana
#     [33] "aate", #aatey , atey , ate
#     [34] "aatii", #atii , aatee , atee
#     [35] "aataa", #ataa , aata , ata
#     [36] "tiiN",
#     [37] "aaoN",
#     [38] "aaeN",
#     [39] "uoN",
#     [40] "ueN",
#     [41] "uaaN",
#     [42] "aaegii", #aegii , aegee , aegi
#     [43] "aaegaa", #aegaa , aega
#     [44] "aaogii", #aogii , aogee
#     [45] "aaoge", #aoge , aogey
#     [46] "eNgii", #engi , engee
#     [47] "eNgii",
#     [48] "eNge",
#     [49] "eNge",
#     [50] "uuNgii", #ungi , ungee , oongi
#     [51] "uuNgaa", #unga , oongaa , oonga
#     [52] "aatiiN", #atin
#     [53] "naaoN", naon
#     [54] "naaeN", naen
#     [55] "taaoN", taon
#     [56] "taaeN", taen , taey , taye
#     [57] "iyaaN", iyan 
#     [58] "iyoN",
#     [59] "iyaaN",
#     [60] "aaeNgii", aengii . aengee
#     [61] "aaeNge", aenge , aengey
#     [62] "aauuNgii", aaungii , aungii , aungi , aoongi
#     [63] "aauuNgaa", aunga , aoonga 
#     [64] "aaiyaaN"
#     [65] "aaiyoN",
#     [66] "aaiyaaN"
# ]

# a -> a or aa
# i -> i or ii or ee
# u -> u or uu or oo
# e$ -> ey , eye


###NEW


# "o"
# "e",	"ey" 
# "u" 
# "i", "ee"
# "kr", "kar"
# "ao"
# "ie", "iey" , "iye" , "iyeh"
# "ai", "aee"
# "ae", "aey" , "aye"
# "ne", "ney"
# "ni", "nee" 
# "na"
# "te", "tey"
# "iN", "ing"
# "ti", "tee"
# "ta"
# "aN"
# "oN",
# "eN",
# "akr" , "akar"
# "aie" , "aiye"
# "aiN"
# "aya"
# "egi", "egee"
# "ega"
# "ogi", "ogee"
# "oge", "ogey"
# "ane", "aney" 
# "ana"
# "ate", "atey" , "ate"
# "ati", "atee"
# "ata"
# "tiN",
# "aoN",
# "aeN",
# "uoN",
# "ueN",
# "uaN",
# "aegi", "aegee" 
# "aega"
# "aogi", "aogee"
# "aoge", "aoge" , "aogey"
# "eNgi", "engee"
# "eNge", "engey"
# "uNgi", "ungee" , "oongi" , "oongee"
# "unga", "oonga"
# "atiN"
# "naoN"
# "naeN"
# "taoN"
# "taeN", "taey" , "taye"
# "iyaN", "iyan" , "iya"
# "iyoN", "iyo"
# "iyaN",
# "aeNgi", "aengee"
# "aeNge", "aenge" , "aengey"
# "auNgi", "aoongi" , "aoongee" 
# "auNga", "aoonga"
# "aiyaN" , "aiya"
# "iyon", "aiya"	

#ARRAY
# Consider suffixes only
# Assume every thing has MALE gender

# "o"			-> "a" 										(kamino -> kamina) X(khayalo -> khayala)
# "e",	"ey" 	-> "a"										(kamine , kamine+y , kaminye -> kamina ; gaye -> gaya ; apne -> apna)
# "u"		 	-> ?										() X(jadu !-> jada)
# "i", "ee"		-> "a"										(kamini , kaminee -> kamina) X(jaldi !-> jalda)
# "kr", "kar"	-> "_"										(bajakr , bajakar -> baja)
# "ao"			-> "a"										(bajao -> baja)
# "{dij}ie", "{dij}iey" , "{dij}iye" , "{dij}iyeh"	-> "_"	(bata{dij}ie , bata{dij}iey , bata{dij}iye , bata{dij}iyeh -> bata)
# "ai", "aee"	-> "a"										(judai -> juda)
# "ae", "aey" , "aye"					-> "a"				(uske -> uska)
#? "ne", "ney" , "nay"					-> "_"				(kaatne -> kaat)
#? "ni", "nee"							-> "_"				(deewani -> )(X(patni), X(chatni))
#? "na"									-> "_"				(katna -> kat, X(sapna !-> sap))
# "te", "tey"							-> "_"				(machalte -> machal)
#? "in", "ing"
# "ti", "tee"							-> "_"				(machalti -> machal, X(saraswati -> saraswa))
# "ta"									-> "_"				(karvata -> karava, mahekta -> mahek)
# "an"
# "on"									-> "a"				(kaminon -> kamina) X(khayalon -> khayala)
# "eN", "ein"							-> "a"				(kaminen , kaminein -> kamina) X(khayalen , khayalein -> khayala)
# "akr" , "akar"						-> "_"				(lekar , dekr , puchkar , pahonchkr) -> (le , de , puch , pahonch)
# "aie" , "aiye"						-> "a"				(khaie -> kha)
# "ain"
# "aya"									-> "a"				(karaya -> kara, X(maya -> ma))
# "egi", "egee"							-> "a"				(karegi -> kara, karvaegi -> karva)
# "ega"									-> "_"				(karega -> kar)
# "ogi", "ogee"							-> "_"				(kaatogi -> kaat)
# "oge", "ogey" , "ogay"				-> "_"				(kaatoge -> kaat)
# "ane", "aney" , "anay"				-> "a"				(katane -> kata, chakhane -> chakha, X(diwane !-> diwa))
# "ana"									-> "a"				(karvana -> karva, X(diwana !-> diwa))
# "ate", "atey" , "ate"					-> "a"								(katey -> kata, machalate -> machala)
# "ati", "atee"							-> "a"								(karvati -> karva)
# "ata"									-> "a"								(marvata -> marva, mata -> ma)
# "aoN",								-> "a"								(kataon -> kata)
# "aeN",								-> "a"								(kataen -> kata, gundaen -> gunda)
# "uoN",								-> "u"								(mrutyuon -> mrutyu)
# "ueN",								-> "u"								(mrutyuen -> mrutyu, X(kuen !-> ku))
# "uaN",
# "aegi", "aegee"						-> "a"								(kataegi -> kata) 
# "aega"								-> "a"								(marvaega -> marva)
# "aogi", "aogee"						-> "a"								(bataogi -> bata)
# "aoge", "aoge" , "aogey"				-> "a"								(bataoge -> bata)
# "eNgi", "engee"						-> "_"								(pahenchanegi -> pahenchan)
# "eNge", "engey", "ege"				-> "_"								(batengey -> bata)
# "uNgi", "ungee" , "oongi" , "oongee" 	-> "_"								(bataungi -> bata)
# "unga", "oonga"						-> "_"								(bataunga -> bata, karaunga -> kara)
# "atiN"
# "naoN"
# "naeN"
# "taoN", "tao"							-> "e"								(bataon -> bate)
# "taeN", "taey" , "taye"				-> "e"								(kataen -> kate, bataye -> bate)
# "iyaN", "iyan" , "iya"				-> "i"								(battiyan -> batti, lakdiya -> lakdi)
# "iyoN", "iyo"							-> "i"								(ladkiyon -> ladki)
# "iyaN",								-> "i"								(khidkiyan -> khidki, X(duniyan !-> duni))
# "aengi", "aengee"						-> "ana"							(marvaengi -> marvana)
# "e{n}ge", "e{n}gey"					-> "_"								(chalenge , chalengey , chalegey -> chal)
# "{a}ungi", "{a}oongi" , "{a}oongee" 	-> "a"								(banauangi , bataungi -> bana , bata)
# "aunga", "aoonga"						-> "a"								(banauanga , bataunga -> bana , bata)
# "{i,e,_}yan" , "{i,e,_}iya"			-> "a"								(ladkiyan , ladkiya , ladkya -> ladka)
# "{i,e,_}yon", "{i,e,_}yo"				-> "a"								(ladkiyon , ladkiya -> ladka)

chud{a}vaungi
chud{a}vaunge
chud{a}vaunga
khaungi
khaoge
khangee


@hindi_suffixes_in_english = [ "o","e", "ey" ,"u" ,"i", "ee","kr", "kar","ao","ie", "iey" , "iye" , "iyeh","ai", "aee","ae", "aey" , "aye","ne", "ney","ni", "nee" ,"na","te", "tey","iN", "ing","ti", "tee","ta","aN","oN","eN","akr" , "akar","aie" , "aiye","aiN","aya","egi", "egee","ega","ogi", "ogee","oge", "ogey","ane", "aney" ,"ana","ate", "atey" , "ate","ati", "atee","ata","tiN","aoN","aeN","uoN","ueN","uaN","aegi", "aegee" ,"aega","aogi", "aogee","aoge", "aoge" , "aogey","eNgi", "engee","eNge", "engey","uNgi", "ungee" , "oongi" , "oongee","unga", "oonga","atiN","naoN","naeN","taoN","taeN", "taey" , "taye","iyaN", "iyan" , "iya","iyoN", "iyo","iyaN", "aeNgi", "aengee","aeNge", "aenge" , "aengey","auNgi", "aoongi" , "aoongee" ,"auNga", "aoonga","aiyaN" , "aiya","aiyoN", "aiya" , "nay" , "ogay" , "anay" , "ay"].sort_by{|x| x.size}

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

	@hindi_suffixes_in_english.each{ |suffix|
		if word.end_with?(suffix.downcase)  
			word.slice!( (word.size - suffix.size ) , (word.size - 1) )
			return word
		end
	}
	return word
end





# .gsub(/(\w){2,})/ , "" )








# Observations and suggestions
# 1. if suffix is the word itself, don't convert
# 2. suffix should be lesser by 2 or more than the original word
# 3. "va" should be converted to "a" at the end, because words like karvati will stem to karva which will further stem to kar or kara
# 4. n after a vowel at the end of word should be removed.
# 5. extra 'a' at the end of a word having la, da, 
# 6.1 when removing na suffix words like sapna losses its meaning. If the root word formed is absent in well formed corpus we can skip stemming for the word
# 6.2 Another soln - Find probablity of occurence of stemmed and original word. The one with higher P(a) stays. For this we need to have perfect word count.
# 7. aega suffix should be removed before ega
# 8. aogi suffix should be removed before ogi
# 9. ane b4 ne
