class AddYearToShow < ActiveRecord::Migration[5.1]
  def change
    add_column :shows, :year, :integer
  end
end
