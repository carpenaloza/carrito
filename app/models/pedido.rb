class Pedido < ApplicationRecord
  belongs_to :destino
  belongs_to :datos_envio
  belongs_to :estado_pedido
end
