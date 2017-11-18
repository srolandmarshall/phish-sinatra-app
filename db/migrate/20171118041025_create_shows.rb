class CreateShows < ActiveRecord::Migration[5.1]
  def change
    create_table :shows do |t|
      t.string :venue
      t.string :city
      t.date :date
      t.string :notes
      t.string :jams
      t.string :tour
    end
  end
end
