module ActsAsCsv
	class CsvRow
		def initialize header, values
			@row_contents = {}
			values.each_with_index do |val, index|
				@row_contents[header[index]] = val
			end
		end
		def method_missing name, *args
			@row_contents[name.to_s]
		end
	end
	def self.included(base)
		base.extend ClassMethods
	end
	module ClassMethods
		def acts_as_csv
			include InstanceMethods
		end
	end
	module InstanceMethods
		def read
			@csv_contents = []
			filename = self.class.to_s.downcase + '.txt'
			file = File.new(filename)
			@headers = file.gets.chomp.split(', ')
			file.each do |row|
				@csv_contents << CsvRow.new(@headers, row.chomp.split(', '))
			end
		end
		attr_accessor :headers, :csv_contents
		def initialize
			read
		end
		def each(&block)
			@csv_contents.each(&block)
		end
	end
end
class RubyCsv
	include ActsAsCsv
	acts_as_csv
end
m = RubyCsv.new
m.each {|row| puts row.poop}