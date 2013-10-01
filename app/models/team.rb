class Team < ActiveRecord::Base
  belongs_to :user
  has_many :politicians
  validates :user_id, uniqueness: true
  validates :name, presence: true
end
