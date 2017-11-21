class AddLinkToTour < ActiveRecord::Migration[5.1]
  def change
    add_column :tours, :link, :string
  end
end
