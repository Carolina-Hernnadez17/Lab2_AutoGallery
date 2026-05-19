# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_05_19_000003) do
  create_table "fotografias", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "angulo"
    t.datetime "created_at", null: false
    t.date "fecha_subida"
    t.string "ruta_archivo", null: false
    t.datetime "updated_at", null: false
    t.bigint "vehiculo_id", null: false
    t.index ["vehiculo_id"], name: "index_fotografias_on_vehiculo_id"
  end

  create_table "marcas", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "nombre_marca", null: false
    t.string "pais_origen"
    t.datetime "updated_at", null: false
  end

  create_table "vehiculos", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "anio"
    t.string "color"
    t.datetime "created_at", null: false
    t.bigint "marca_id", null: false
    t.string "modelo", null: false
    t.datetime "updated_at", null: false
    t.index ["marca_id"], name: "index_vehiculos_on_marca_id"
  end

  add_foreign_key "fotografias", "vehiculos"
  add_foreign_key "vehiculos", "marcas"
end
