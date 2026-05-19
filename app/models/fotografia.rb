class Fotografia < ApplicationRecord
  self.table_name = "fotografias"

  belongs_to :vehiculo, inverse_of: :fotografias

  validates :ruta_archivo, presence: true, uniqueness: { scope: :vehiculo_id, case_sensitive: false }
end