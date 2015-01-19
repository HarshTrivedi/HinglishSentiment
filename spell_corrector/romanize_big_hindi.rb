require 'unidecoder'
File.open("/home/harsh/spell_corrector/romanized_big_hindi.txt", "w") do |fw|

	File.open("/home/harsh/spell_corrector/BigHindi.txt", "r") do |f|
	  f.each_line do |line|
	    fw.write(line.to_ascii)
	  end
	end

end