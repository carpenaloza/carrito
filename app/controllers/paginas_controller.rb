class PaginasController < ApplicationController

    before_action :validar_carro

    def inicio
        @todos_los_productos = Producto.select(:id, :nombre, :precio, :cantidad, :descripcion).order(nombre: :asc)
    end

end

