class DeleteUserReviews < ActiveRecord::Migration[5.1]
  def change
    drop_table :user_reviews
  end
end
