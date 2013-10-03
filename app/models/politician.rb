class Politician < ActiveRecord::Base
  belongs_to :team
  has_many :scores

  def info
    "#{self.title}. #{self.first_name} #{self.last_name}, #{self.state} [#{self.party}]"
  end
end
