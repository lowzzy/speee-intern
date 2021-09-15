class AddAdressToCandidateBuyer < ActiveRecord::Migration[6.1]
  def change
    add_column :candidate_buyers, :address, :string
  end
end
