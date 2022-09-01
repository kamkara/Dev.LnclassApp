class ApplicationController < ActionController::Base
    #store user action before authenticated
    after_action :store_action

    protect_from_forgery with: :exception
    before_action :find_citytown

    #Keep clean Application conroller, moved on noncern
    include DeviseConfiguration
    
    
    # Overwriting the sign_out redirect path method
    def after_sign_out_path_for(resource_or_scope)
        root_path
    end

    def after_sign_in_path_for(resource)
        feed_path
    end

    #User Ombording
    def after_sign_up_path_for(resource)
        case current_user.user_role 
        when "Student"
            profil_path
        when "Teacher"
            profil_path
        when "Ambassadeur"
            dashboard_path
        when "Team"
            dashboard_path            
        else
            root_path
        end
    end
  
private

    def find_citytown
        @citytowns = Citytown.all
    end

    def store_action
        return unless request.get? 
        if (request.path != "/users/sign_in" &&
            request.path != "/users/sign_up" &&
            request.path != "/users/password/new" &&
            request.path != "/users/password/edit" &&
            request.path != "/users/confirmation" &&
            request.path != "/users/sign_out" &&
            !request.xhr?) # don't store ajax calls
        store_location_for(:user, request.fullpath)
        end
    end
end
