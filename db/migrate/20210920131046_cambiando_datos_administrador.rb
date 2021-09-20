class CambiandoDatosAdministrador < ActiveRecord::Migration[6.1]
  def change
    rename_column :administradores, :nombre_usuario, :correo
    add_column :administradores, :nombre, :string
  end
end
