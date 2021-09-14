class CreateProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :properties do |t|
      t.integer :age
      t.string :prefecture
      t.string :city
      t.string :station
      t.string :floor_plan
      t.integer :square_measure
      t.integer :construction_type # マンションか一軒家か
      t.integer :material_type # 木造か鉄筋か
      t.timestamps
    end
  end
end
