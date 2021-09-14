class CreateMediationContracts < ActiveRecord::Migration[6.1]
  def change
    create_table :mediation_contracts do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :temp_price

      t.timestamps
    end
  end
end
