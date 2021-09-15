class CreateCandidateBuyers < ActiveRecord::Migration[6.1]
  def change
    create_table :candidate_buyers do |t|
      t.text :hearing, null: false

      t.timestamps
    end
  end
end
