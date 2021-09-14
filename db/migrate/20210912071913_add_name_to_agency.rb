class AddNameToAgency < ActiveRecord::Migration[6.1]
  def change
    add_column :agencies, :name, :string
  end
end
