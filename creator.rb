#!/usr/bin/ruby -w
require 'json'

def main()
	rand = Random.new
	dict = JSON.parse(readFromFile)
	words_numb = 0
	text = ""
	prev_perc = "0%"
	puts prev_perc
	while words_numb < 50000
		new_text, len =  makeSentence(randomSequence(rand), dict)
		text += new_text + " "
		words_numb += len
		cur_perc = progress(words_numb)
		unless cur_perc == prev_perc
			puts cur_perc
			prev_perc = cur_perc
		end
	end
	writeToFile(text)
end

def progress(words_numb)
	return "#{words_numb * 100 / 50000}" + "%"
end

def writeToFile(text) 
	result_file = File.new("speach.txt", "w")
	result_file.write(text)
	result_file.close()
end

def makeSentence(seq, dict)
	sentence = ""
	for i in 0..3 do
		sentence += dict["#{i}"]["#{seq[i]}"] + " "
	end
	len = sentence.split(" ").length
	return sentence, len
end

def readFromFile
	return File.read("dictionary.json")
end

def randomSequence(rand)
	rand_seq = []
	for i in 0..3 do
		rand_seq[i] = rand(5)
	end
	return rand_seq
end

if __FILE__ == $0 
	main()
end