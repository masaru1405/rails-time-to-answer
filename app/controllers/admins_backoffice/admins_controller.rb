class AdminsBackoffice::AdminsController < AdminsTemplateController
   before_action :password_verify, only: [:update]

   def index
      @admins = Admin.all.page(params[:page]).per(5)
   end

   def edit
      @admin = Admin.find(params[:id])
   end

   def update
      @admin = Admin.find(params[:id])
      if @admin.update(admin_params)
         flash[:success] = "Administrador atualizado com sucesso!"
         redirect_to admins_backoffice_admins_path
      else
         render :edit
      end
   end

   def new
      @admin = Admin.new
   end

   def create
      @admin = Admin.new(admin_params)
      if @admin.save
         flash[:success] = "Administrador criado com sucesso!"
         redirect_to admins_backoffice_admins_path
      else
         render :new
      end
   end

   def destroy
      @admin = Admin.find(params[:id])
      admin_deleted = @admin.email
      if @admin.destroy
         flash[:danger] = "Administrador #{admin_deleted} excluído!"
         redirect_to admins_backoffice_admins_path
      else
         render :index
      end
   end

   private
      def admin_params
         params.require(:admin).permit(:email, :password, :password_confirmation)
      end

      #verifica se os campos password e password_confirmation estão em branco
      def password_verify
          #atualizando apenas o email
         if params[:admin][:password].blank? && params[:admin][:password_confirmation].blank?
            #retira os campos password e password_confirmation da chave :admin
            params[:admin].extract!(:password, :password_confirmation)
         end
      end
end
