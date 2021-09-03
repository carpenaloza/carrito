class PaginasController < ApplicationController

    before_action :validar_carro

    def inicio
        

        @todos_los_productos = Producto.select(:id, :nombre, :precio, :cantidad, :descripcion).order(nombre: :asc)
    end

    def carro
        
    end

    def formulario_pedido
        @destinos = Destino.select(:id, :nombre).order(nombre: :asc)
    end

    def enviar_saludo
        ClienteMailer.with(saludo: 'hola').enviar_hola_mundo.deliver_later
    end

end

