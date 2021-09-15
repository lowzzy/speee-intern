class AddUserIdColumnToProperty < ActiveRecord::Migration[6.1]
  def change
    add_column :properties,:user_id ,:integer, null: true
  end
end
