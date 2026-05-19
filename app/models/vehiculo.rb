class Vehiculo < ApplicationRecord
  self.table_name = "vehiculos"

  belongs_to :marca, inverse_of: :vehiculos
  has_many :fotografias, dependent: :destroy, inverse_of: :vehiculo

  validates :modelo, presence: true
end