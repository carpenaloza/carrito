class PedidosController < ApplicationController
    include PedidosHelper

    layout 'paginas'
    
    before_action :validar_carro

    # GET
    def crear
        # @datos_envio = DatosEnvio.new
        @datos_formulario = DatosEnvioFormulario.new
        consultar_destinos  # 🚧
    end

    # GET
    def pagar

    end

    # POST
    def guardar

        @datos_formulario = DatosEnvioFormulario.new(params_datos_formulario)
        
        if @datos_formulario.valid? 

            @datos_envio = crear_datos_envio(@datos_formulario)
            @pedido = definir_pedido(
                @carro.total,
                @datos_formulario,
                @datos_envio
            )

            if @pedido.save
                migrar_productos(@carro, @pedido)
                enviar_correo       # 📬                    
                eliminar_carrito    # 🛒
                render :pagar       # 💰
            else
                consultar_destinos  # 🚧
                render :crear
            end
        else
            
            consultar_destinos  # 🚧
            render :crear 
        end
    end

    private
    def params_datos_formulario
        params.require(:pedidos_helper_datos_envio_formulario).permit(:nombre, :correo, :direccion, :telefono, :destino_id)
    end

    # def params_datos_envio
    #     params.require(:pedidos_helper_datos_envio_formulario).permit(:nombre, :correo, :direccion, :telefono)
    # end

    # def params_destino
    #     params.require(:pedidos_helper_datos_envio_formulario).permit(:destino_id)
    # end

    def enviar_correo
        ClienteMailer.with(
            datos_envio_correo: @datos_envio, 
            pedido_correo: @pedido)
            .enviar_correo_pedido.deliver_later
    end

    def eliminar_carrito
        session[:carro_id] = nil
        @carro.destroy
    end

    def consultar_destinos
        @destinos = Destino.select(:id, :nombre).order(nombre: :asc)
    end

end