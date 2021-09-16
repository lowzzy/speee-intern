class RemoveStationFromProperty < ActiveRecord::Migration[6.1]
  def change
    remove_column :properties, :station, :string
  end
end
