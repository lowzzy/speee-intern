class CreateBuyContract < ActiveRecord::Migration[6.1]
  def change
    create_table :buy_contracts do |t|
      t.integer :user_id
      t.integer :buyer_id
      t.integer :final_price
      t.timestamps
    end
  end
end
