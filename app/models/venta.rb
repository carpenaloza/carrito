class Venta < ApplicationRecord
  belongs_to :tipo_pago
  belongs_to :pedido
end
