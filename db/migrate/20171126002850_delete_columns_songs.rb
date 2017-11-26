class DeleteColumnsSongs < ActiveRecord::Migration[5.1]
  def change
    drop_table :setlists
    drop_table :setlist_shows
  end
end
