class CreateAssessments < ActiveRecord::Migration[6.1]
  def change
    create_table :assessments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :property, null: false, foreign_key: true
      t.references :agency, null: false, foreign_key: true
      t.integer :temp_price

      t.timestamps
    end
  end
end
