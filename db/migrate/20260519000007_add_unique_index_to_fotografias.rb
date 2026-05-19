class AddUniqueIndexToFotografias < ActiveRecord::Migration[8.1]
  def change
    add_index :fotografias, [:vehiculo_id, :ruta_archivo], unique: true, name: "index_fotografias_on_vehiculo_id_ruta_archivo"
  end
end
