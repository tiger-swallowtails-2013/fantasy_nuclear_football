$LOAD_PATH.unshift(File.expand_path('.'))
require 'config/main'

class PoliticiansImporter
	def self.import(filename = File.dirname(__FILE__) + "/../db/data/legislators.csv")
		header = nil
		CSV.foreach(filename) do |line|
			if header.nil?
				header = line.map{|item| item.to_sym}
			else
				attributes = Hash[header.zip(line)]
				Politician.create!({
					first_name: attributes[:firstname],
					nickname: attributes[:nickname],
					last_name: attributes[:lastname],
					middle_name: attributes[:middlename],
					suffix: attributes[:name_suffix],
					title: attributes[:title],
					gender: attributes[:gender],
					bioguide_id: attributes[:bioguide_id],
					party: attributes[:party],
					state: attributes[:state],
					district: attributes[:district],
					senate_class: attributes[:senate_class],
					twitter_id: attributes[:twitter_id],
					facebook_id: attributes[:facebook_id],
					birthday: attributes[:birthdate]	
					})
			end
		end
	end
end