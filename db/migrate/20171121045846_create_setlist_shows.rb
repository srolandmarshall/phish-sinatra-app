class CreateSetlistShows < ActiveRecord::Migration[5.1]
  def change
    create_table :setlist_shows do |t|
      t.integer :setlist_id
      t.integer :show_id
    end
  end
end
