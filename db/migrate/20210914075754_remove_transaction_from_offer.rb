class RemoveTransactionFromOffer < ActiveRecord::Migration[6.1]
  def change
    remove_column :offers, :transaction, :datetime
  end
end
