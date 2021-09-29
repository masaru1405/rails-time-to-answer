class UsersTemplateController < ApplicationController
   before_action :authenticate_user!
   before_action :build_user
   layout 'users_backoffice'


   private 
      def build_user
         current_user.build_user_profile if current_user.user_profile.blank?
      end
   
end
