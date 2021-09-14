class Admin::PedidosController < Admin::AdminController
include Admin::PedidosHelper

    before_action :asignar_pedido, only: [:mostrar, :editar, :actualizar]
    # GET
    def listar
        @pedidos = Pedido.select(:id, :codigo, :total, :created_at).order(created_at: :desc)
    end

    # GET
    def mostrar
    end

    # GET
    def crear
    end

    # GET
    def editar
        @datos_pedido = PedidosFormulario.new
        @datos_pedido.id = @pedido.id
        @datos_pedido.nombre = @pedido.datos_envio.nombre
        @datos_pedido.correo = @pedido.datos_envio.correo
        @datos_pedido.telefono = @pedido.datos_envio.telefono
        @datos_pedido.direccion = @pedido.datos_envio.direccion
        @datos_pedido.destino_id = @pedido.destino.id

        @datos_pedido.estado_id = @pedido.estados_pedido.id
        @estados = EstadosPedido.select(:id, :estado).order(estado: :asc)

        @destinos = Destino.select(:id, :nombre).order(nombre: :asc)
    end

    # POST
    def guardar
    end

    # PUT/PATCH
    def actualizar
        @datos_pedido = PedidosFormulario.new(params_pedidos)
        if @datos_pedido.valid?
            @pedido.datos_envio.nombre = @datos_pedido.nombre
            @pedido.datos_envio.correo = @datos_pedido.correo
            @pedido.datos_envio.telefono = @datos_pedido.telefono
            @pedido.datos_envio.direccion = @datos_pedido.direccion

            @pedido.destino = Destino.find(@datos_pedido.destino_id)
            @pedido.estados_pedido = EstadosPedido.find(@datos_pedido.estado_id)

            if @pedido.save
                redirect_to action: :mostrar
            else
                @destinos = Destino.select(:id, :nombre).order(nombre: :asc)
                @estados = EstadosPedido.select(:id, :estado).order(estado: :asc)
                render :editar
            end
            
        else
            @destinos = Destino.select(:id, :nombre).order(nombre: :asc)
            render :editar
        end
    end

    # DELETE
    def eliminar
    end

    private 
    def params_pedidos
        params.require(:admin_pedidos_helper_pedidos_formulario)
        .permit(:nombre, :correo, :telefono, :direccion, :destino_id, :estado_id)
    end

    def asignar_pedido
        @pedido = Pedido.find(params[:id])
    rescue ActiveRecord::RecordNotFound

        flash[:errors] = "Pedido #{params[:id]} no encontrado"
        redirect_to action: :listar
    end

end