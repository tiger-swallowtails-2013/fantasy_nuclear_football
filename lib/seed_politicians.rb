$LOAD_PATH.unshift(File.expand_path('.'))
require 'config/main'

require 'CSV'

class PoliticiansImporter
	def self.import(filename = File.dirname(__FILE__) + "/../db/data/legislators.csv")
		header = nil
		CSV.foreach(filename) do |line|
			if header.nil?
				header = line.map{|item| item.to_sym}
			else
				attributes = Hash[header.zip(line)]
			end
		end
	end
end