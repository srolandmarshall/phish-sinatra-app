class CreateSetlist < ActiveRecord::Migration[5.1]
  def change
    create_table :setlists do |t|
      t.string :set1
      t.string :set2
      t.string :set3
      t.string :set4
      t.string :encore
      t.string :soundcheck
    end
  end
end
