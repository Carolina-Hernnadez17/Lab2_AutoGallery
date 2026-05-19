class CreateVehiculos < ActiveRecord::Migration[8.1]
  def change
    create_table :vehiculos do |t|
      t.string :modelo, null: false
      t.integer :anio
      t.string :color
      t.references :marca, null: false, foreign_key: true

      t.timestamps
    end
  end
end