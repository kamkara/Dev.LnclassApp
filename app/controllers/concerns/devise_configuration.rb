#Whitelist additional fields for devise User objects.
module DeviseConfiguration
    extend ActiveSupport::Concern
    
    #Required to accept fields created outside of devise for User
    included do
        
        before_action :configure_permitted_parameters, if: :devise_controller?
     end

     #Configure permitted parameters
    def configure_permitted_parameters
        #Sign Up account params
        sign_up_params = [:first_name, :last_name, :full_name, :contact, :matricule,
            :user_role, :gender, :city_name, :level_name, :material_name, :doublant, :slug]
        #Update account params
        update_params = [:first_name, :last_name, :full_name, :contact, :matricule,
            :user_role, :gender, :city_name, :level_name, :material_name, :doublant, 
            :password, :password_confirmation, :current_password]

        devise_parameter_sanitizer.permit(:sign_in, keys: [:logged, :password])
        devise_parameter_sanitizer.permit(:sign_up, keys: sign_up_params )
        devise_parameter_sanitizer.permit(:account_update, keys: update_params)
    end

end
