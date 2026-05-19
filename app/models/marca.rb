class Marca < ApplicationRecord
  self.table_name = "marcas"

  has_many :vehiculos, dependent: :destroy, inverse_of: :marca

  validates :nombre_marca, presence: true, uniqueness: { case_sensitive: false }
end