class CreateTown < ActiveRecord::Migration[6.1]
  def change
    create_table :towns do |t|
      t.integer :city_id
      t.timestamps
    end
  end
end
