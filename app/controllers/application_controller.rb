class ApplicationController < ActionController::Base
     #before_action :authenticate_user!
    protect_from_forgery with: :exception
    

    #Keep clean Application conroller, moved on noncern
    include DeviseConfiguration

    def after_sign_in_path_for(resource)
        if current_user.user_role === "Student"
         feed_path
        else
         root_path
        end
    end

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

end
