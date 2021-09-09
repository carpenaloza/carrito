module ApplicationHelper
    def validar_carro
        if session[:carro_id]
            carro_id = session[:carro_id]
            @carro = Carro.find(carro_id)
        else
            @carro = Carro.create(total: 0)
            session[:carro_id] = @carro.id
        end
    rescue ActiveRecord::RecordNotFound
        redirect_to root_path
    end



    # def validar_sesion
    #     if session[:admin_id]
    #         @admin = Administrador.find(session[:admin_id])
    #     else
    #         eliminar_cookie
    #     end
    # rescue ActiveRecord::RecordNotFound
    #     eliminar_cookie
    # end

    # private
    # def eliminar_cookie
    #     session[:admin_id] = nil
    #     redirect_to sesiones_path
    # end
end
