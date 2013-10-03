class Politician < ActiveRecord::Base
  belongs_to :team
  has_many :scores

  def self.getAllTwitterHandles
  	all.delete_if{ |politician| politician.in_office == false || politician.twitter_id.nil? }.map{ |politician| politician.twitter_id }.map!{|politician| "@#{politician}"}
  end
end
