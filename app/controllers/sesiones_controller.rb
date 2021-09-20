class SesionesController < ApplicationController

    #POST
    def iniciar_sesion
        @usuario_actual = Administrador.find_by(correo: sesion_params[:correo])

        if @usuario_actual
            if @usuario_actual.authenticate(sesion_params[:password])
                session[:usuario_id] = @usuario_actual.id
                redirect_to admin_pedidos_path
            else
                flash[:error_sesion] = "Correo/Contraseña inválidos"
                redirect_to root_path
            end
        else
            flash[:error_session] = "Usuario no registrado"
            redirect_to root_path
        end
    end

    #DELETE
    def cerrar_sesion
        session[:usuario_id] = nil
        redirect_to root_path
    end

    private

    def sesion_params
        params.permit(:correo, :password)
    end
    
    # # GET
    # def login
    #     if session[:admin_id]
    #         redirect_to categorias_path
    #     end
    # end

    # # POST
    # def iniciar
    #     # nombre_usuario_formulario = params[:nombre_usuario]
    #     admin = Administrador.find_by(nombre_usuario: params[:nombre_usuario])
        
    #     if admin and admin.authenticate(params[:password])
    #         session[:admin_id] = admin.id
    #         redirect_to categorias_path
    #     else
    #         flash[:error_sesion] = "Nombre usuario o contraseña equivocados"
    #         render :login
    #     end
    # end

    

    # # DELETE
    # def cerrar
    #     session[:admin_id] = nil
    #     redirect_to login_path
    # end
end