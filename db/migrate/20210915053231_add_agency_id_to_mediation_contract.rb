class AddAgencyIdToMediationContract < ActiveRecord::Migration[6.1]
  def change
    add_column :mediation_contracts,:agency_id ,:integer, null: true
  end
end
