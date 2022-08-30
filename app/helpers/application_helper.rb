module ApplicationHelper
    #Onglet Title
    def title
        base_title = "Lnclass Education"
        if @title.nil?
        base_title
        else
        "#{@title} • #{base_title}"
        end
    end
     def app_name
      "Lnclass Education"
     end

     def language
      "fr"
     end
    #site description
    def description
        "Etudier avec facilité."
    end
    #Site Keys worlds
    def keywords
    "Tle, Bac, Terminale A1 Terminale A2,2nd C ..."
    end
    #Theme color
    def theme_color
      "#020408"      
    end
    
    def tileColor
      "#020408"
    end
    
    #FLASH NOTICE
    def tailwind_class_for_flash(flash_type)
      case flash_type
      when 'success'
        'alert-success'
      when 'error'
        'alert-danger'
      when 'alert'
        'alert-warning'
      when 'notice'
        'alert-info'
      else
        flash_type.to_s
      end
    end

    #Add User Flash
    def user_flash
        render "shared/flash/user_flash"
    end
    #form error notification 
    def form_error_notification(object)
      if object.errors.any?
        tag.div class: "error-message" do
          object.errors.full_messages.to_sentence.capitalize
        end
      end
    end
    
end
