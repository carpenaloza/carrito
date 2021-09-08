class CambiarNombreEstadosPedido < ActiveRecord::Migration[6.1]
  def change
    rename_column :pedidos, :estados_pedidos_id, :estados_pedido_id
    rename_column :datos_envios, :coreeo, :correo
  end
end
