class DeleteSongsColumns < ActiveRecord::Migration[5.1]
  def change
    remove_column :songs, :vocals
    remove_column :songs, :debut_date
    remove_column :songs, :original_album
    remove_column :songs, :aka
    remove_column :songs, :last_played
  end
end
