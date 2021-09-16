class AddTransactedOnToOffer < ActiveRecord::Migration[6.1]
  def change
    add_column :offers, :transacted_on, :datetime
  end
end
