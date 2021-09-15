class ChagePropertyColumnType < ActiveRecord::Migration[6.1]
  def change
    change_column :properties,:prefecture, :integer
  end
end
