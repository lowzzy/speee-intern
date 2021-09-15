class ChangeColumnsAddNotnullOnCandidateBuyer < ActiveRecord::Migration[6.1]
  def change
    change_column_null :candidate_buyers, :name, false
    change_column_null :candidate_buyers, :address, false
  end
end
