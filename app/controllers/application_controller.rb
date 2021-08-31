class ApplicationController < ActionController::Base

   def after_sign_in_path_for(resource)
      if user_signed_in?
         users_backoffice_welcome_index_path
      elsif admin_signed_in?
         admins_backoffice_welcome_index_path
      end
   end
end
