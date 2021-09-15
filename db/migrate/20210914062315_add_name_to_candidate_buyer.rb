class AddNameToCandidateBuyer < ActiveRecord::Migration[6.1]
  def change
    add_column :candidate_buyers, :name, :string
  end
end
