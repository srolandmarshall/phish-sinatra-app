class Song < ActiveRecord::Base

  has_many :setlists
  has_many :shows, through: :setlists

end
