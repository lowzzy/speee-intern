class ChangeStatusDefaultOnUsers < ActiveRecord::Migration[6.1]
  def change
    change_column_default :users, :status, from: nil, to: 0
  end
end
