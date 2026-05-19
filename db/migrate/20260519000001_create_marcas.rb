class CreateMarcas < ActiveRecord::Migration[8.1]
  def change
    create_table :marcas do |t|
      t.string :nombre_marca, null: false
      t.string :pais_origen

      t.timestamps
    end
  end
end