class Show < ActiveRecord::Base

  belongs_to :tour
  has_many :songs
  has_many :user_shows
  has_many :users, through: :user_shows

end
