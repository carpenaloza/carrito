class SesionesController < ApplicationController
    
    # GET
    def login
        if session[:admin_id]
            redirect_to oficinas_path
        end
    end

    # POST
    def iniciar
        # nombre_usuario_formulario = params[:nombre_usuario]
        admin = Administrador.find_by(nombre_usuario: params[:nombre_usuario])
        
        if admin and admin.authenticate(params[:password])
            session[:admin_id] = admin.id
            redirect_to oficinas_path
        else
            flash[:error_sesion] = "Nombre usuario o contraseña equivocados"
            render :login
        end
    end

    # DELETE
    def cerrar
        session[:admin_id] = nil
        redirect_to login_path
    end
end