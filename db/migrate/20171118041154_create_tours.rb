class CreateTours < ActiveRecord::Migration[5.1]
  def change
    create_table :tours do |t|
      t.string :name
      t.integer :year
      t.integer :num_shows
    end
  end
end
