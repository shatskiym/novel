#!/usr/bin/ruby -w
require 'json'

def main()
	file = JSON.parse(readFromFile)
end

def readFromFile
	return File.read("dictionary.json")
end

if __FILE__ == $0 
	main()
end