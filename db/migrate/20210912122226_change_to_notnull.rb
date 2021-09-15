class ChangeToNotnull < ActiveRecord::Migration[6.1]
  def up
    change_column_null :agencies, :name, false
    change_column_null :agencies, :email, false
    change_column_null :agencies, :tel, false
  end

  def down
    change_column_null :agencies, :name, true
    change_column_null :agencies, :email, true
    change_column_null :agencies, :tel, true
  end
end
