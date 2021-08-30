module ApplicationHelper
    def validar_sesion
        if session[:admin_id]
            @admin = Administrador.find(session[:admin_id])
        else
            eliminar_cookie
        end
    rescue ActiveRecord::RecordNotFound
        eliminar_cookie
    end

    private
    def eliminar_cookie
        session[:admin_id] = nil
        redirect_to sesiones_path
    end
end
