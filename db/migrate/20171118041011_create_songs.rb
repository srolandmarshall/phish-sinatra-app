class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.string :name
      t.string :original_artist
      t.date :debut_date
      t.integer :times_played
      t.date :last_played
      t.integer :gap
      t.string :aka
      t.text :history
      t.text :lyrics
      t.string :musandlyr
      t.string :vocals
      t.string :original_album
    end
  end
end
