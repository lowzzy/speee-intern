class AddCandidateBuyerIdToOffer < ActiveRecord::Migration[6.1]
  def change
    add_column :offers, :candidate_buyer_id, :bigint
  end
end
