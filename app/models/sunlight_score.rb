class SunlightScore < ActiveRecord::Base
  validates_uniqueness_of :sunlight_timestamp
end
