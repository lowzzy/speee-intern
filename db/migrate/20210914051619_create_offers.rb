class CreateOffers < ActiveRecord::Migration[6.1]
  def change
    create_table :offers do |t|
      t.integer :price
      t.datetime :transaction

      t.timestamps
    end
  end
end
