class UsersBackoffice::UserProfileController < UsersTemplateController

   before_action :set_user
   before_action :password_verify, only: [:update]

   def edit
      @user.build_user_profile if @user.user_profile.blank? #video 214
   end

   def update 
      if @user.update(params_user)
         bypass_sign_in(@user) #faz login automaticamente
         if params_user[:user_profile_attributes][:avatar]
            redirect_to users_backoffice_welcome_index_path
         else
            users_backoffice_user_profile_path
         end
      else
         render :edit
      end
   end

   private
   def set_user
      @user = User.find(current_user.id)
   end

   def params_user
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation,user_profile_attributes: [:id, :address, :gender, :birthday, :avatar])
   end 

   #Verifica se os campos password e password_confirmation estão em branco, pois por padrão
   #ao se atualizar um admin ou user, deve-se informar a senha. Mas caso queiramos apenas
   #atualizar o email, o método abaixo verifica isso.
   def password_verify
      #atualizando apenas o email:
     if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
        #retira os campos password e password_confirmation da chave :admin
        params[:user].extract!(:password, :password_confirmation)
     end
  end
end
