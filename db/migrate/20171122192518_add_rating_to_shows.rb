class AddRatingToShows < ActiveRecord::Migration[5.1]
  def change
    add_column :shows, :rating, :float
  end
end
