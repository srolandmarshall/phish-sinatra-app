class Setlist < ActiveRecord::Base

  belongs_to :show
  has_many :songs

end
