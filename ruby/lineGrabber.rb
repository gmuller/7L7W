require 'trollop'
opts = Trollop::options do
	opt :filename, "the File to process", :type => String
	opt :match, "the file to match", :type => String
end

lineNumber = 1
File.foreach(opts[:filename]) do |line|
	puts "#{lineNumber} #{line}" if line.match(opts[:match])
	lineNumber += 1
end