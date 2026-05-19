class FixRutaArchivoLengthAndCascades < ActiveRecord::Migration[8.1]
  def up
    # 3. y 5. Aumentar límite de largo de URL a 750 (compatible con index InnoDB de utf8mb4)
    change_column :fotografias, :ruta_archivo, :string, limit: 750

    # 4. Asegurar restricción ON DELETE CASCADE a nivel Base de Datos
    remove_foreign_key :vehiculos, :marcas
    add_foreign_key :vehiculos, :marcas, on_delete: :cascade

    remove_foreign_key :fotografias, :vehiculos
    add_foreign_key :fotografias, :vehiculos, on_delete: :cascade
  end

  def down
    change_column :fotografias, :ruta_archivo, :string, limit: 255

    remove_foreign_key :vehiculos, :marcas
    add_foreign_key :vehiculos, :marcas

    remove_foreign_key :fotografias, :vehiculos
    add_foreign_key :fotografias, :vehiculos
  end
end
