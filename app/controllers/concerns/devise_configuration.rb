#Whitelist additional fields for devise User objects.
module DeviseConfiguration
    extend ActiveSupport::Concern
    
    #Required to accept fields created outside of devise for User
    included do
        
        
     end


end
