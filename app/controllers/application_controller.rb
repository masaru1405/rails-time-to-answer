class ApplicationController < ActionController::Base
   layout :layout_by_resource
   before_action :check_pagination

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

   def check_pagination
      #se usuário não estiver logado, remova o params[:page]
      unless user_signed_in?
         params.extract!(:page)
      end
   end
end
