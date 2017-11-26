class Show < ActiveRecord::Base

  belongs_to :tour
  has_many :reviews
  has_many :songs

end
