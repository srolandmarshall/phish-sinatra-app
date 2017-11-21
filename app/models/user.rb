class User < ActiveRecord::Base

has_secure_password
has_many :user_shows
has_many :shows, through: :user_shows

end
