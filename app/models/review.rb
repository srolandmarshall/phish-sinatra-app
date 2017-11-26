class Review < ActiveRecord::Base

belongs_to :show
belongs_to :user
has_many :show_reviews

end
