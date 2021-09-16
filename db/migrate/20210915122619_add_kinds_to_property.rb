class AddKindsToProperty < ActiveRecord::Migration[6.1]
  def change
    add_column :properties, :kinds, :integer
  end
end
