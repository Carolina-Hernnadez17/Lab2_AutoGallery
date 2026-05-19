class CreateFotografias < ActiveRecord::Migration[8.1]
  def change
    create_table :fotografias do |t|
      t.string :ruta_archivo, null: false
      t.string :angulo
      t.date :fecha_subida
      t.references :vehiculo, null: false, foreign_key: true

      t.timestamps
    end
  end
end