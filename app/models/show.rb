class Show < ActiveRecord::Base

  belongs_to :tour
  has_many :songs, through: :setlists
  has_many :users
  # , through: :user_shows

end
