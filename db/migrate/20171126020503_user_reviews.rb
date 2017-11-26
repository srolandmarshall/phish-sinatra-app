class UserReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :user_reviews do |t|
      t.integer :review_id
      t.integer :user_id
    end
  end
end
