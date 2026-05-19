class Vehiculo < ApplicationRecord
  self.table_name = "vehiculos"

  belongs_to :marca, inverse_of: :vehiculos
  has_many :fotografias, dependent: :destroy, inverse_of: :vehiculo

  validates :modelo, presence: true, uniqueness: { scope: :marca_id, case_sensitive: false }
  validates :precio, presence: true, numericality: { greater_than_or_equal_to: 0 }
end