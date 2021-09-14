class AddEmailToAgency < ActiveRecord::Migration[6.1]
  def change
    add_column :agencies, :email, :string
  end
end
