class AddUniqueIndexToMarcas < ActiveRecord::Migration[8.1]
  def change
    add_index :marcas, :nombre_marca, unique: true, name: "index_marcas_on_nombre_marca"
  end
end
