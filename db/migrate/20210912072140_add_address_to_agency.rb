class AddAddressToAgency < ActiveRecord::Migration[6.1]
  def change
    add_column :agencies, :address, :string
  end
end
