class AddTourIdToShow < ActiveRecord::Migration[5.1]
  def change
    add_column :shows, :tour_id, :integer
  end
end
