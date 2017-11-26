class User < ActiveRecord::Base

has_secure_password
has_many :user_reviews
has_many :reviews, through: :user_reviews

end
