class CreateShowReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :show_reviews do |t|
      t.integer :review_id
      t.integer :show_id
    end
  end
end
