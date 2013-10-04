$LOAD_PATH.unshift(File.expand_path('.'))
require 'config/main'

require 'csv'

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
					in_office: attributes[:in_office],
					birthday: attributes[:birthdate]	
					})
			end
		end
	end

	def self.seed_bios
		Politician.all.each do |politician|
			if(politician.bio.nil?)
				page = Nokogiri::HTML(open("http://bioguide.congress.gov/scripts/biodisplay.pl?index=#{politician.bioguide_id}"))
				politician.bio = page.css('p')[0].text
				politician.save
			end
		end
	end
end