class ApplicationController < ActionController::Base
   layout :layout_by_resource

   def after_sign_in_path_for(resource)
      if user_signed_in?
         users_backoffice_welcome_index_path
      elsif admin_signed_in?
         admins_backoffice_welcome_index_path
      end
   end

   def layout_by_resource
      if devise_controller? && resource_class == Admin
         "admin_devise"
      else 
         "application" #utiliza o layout application
      end
   end
end
