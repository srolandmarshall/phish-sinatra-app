class AddLinkToSong < ActiveRecord::Migration[5.1]
  def change
    add_column :songs, :link, :string
  end
end
