class Song < ActiveRecord::Base
  has_many :shows
end
