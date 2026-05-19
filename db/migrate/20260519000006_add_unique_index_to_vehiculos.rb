class AddUniqueIndexToVehiculos < ActiveRecord::Migration[8.1]
  def change
    add_index :vehiculos, [:marca_id, :modelo], unique: true, name: "index_vehiculos_on_marca_id_modelo"
  end
end
