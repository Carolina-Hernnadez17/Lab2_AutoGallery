class Fotografia < ApplicationRecord
  self.table_name = "fotografias"

  belongs_to :vehiculo, inverse_of: :fotografias

  validates :ruta_archivo, presence: true
end