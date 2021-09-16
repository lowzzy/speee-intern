class CreateBuyContract < ActiveRecord::Migration[6.1]
  def change
    create_table :buy_contracts do |t|
      t.integer :final_price
      t.references :user,foreign_key: true
      t.references :candidate_buyer,foreign_key: true
      t.timestamps
    end
  end
end
