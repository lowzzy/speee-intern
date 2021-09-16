class ChangeColumnsAddNotNullOnOffers < ActiveRecord::Migration[6.1]
  def change
    change_column_null :offers, :price, false
    change_column_null :offers, :transacted_on, false
  end
end
