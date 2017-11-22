class AddDateStringToShow < ActiveRecord::Migration[5.1]
  def change
    add_column :shows, :date_string, :string
  end
end
