class DeleteShowReviews < ActiveRecord::Migration[5.1]
  def change
    drop_table :show_reviews
  end
end
