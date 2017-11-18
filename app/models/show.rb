class Show < ActiveRecord::Base

  belongs_to :tour
  has_many :songs, through: :setlists

end
