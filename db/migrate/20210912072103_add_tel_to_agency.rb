class AddTelToAgency < ActiveRecord::Migration[6.1]
  def change
    add_column :agencies, :tel, :string
  end
end
