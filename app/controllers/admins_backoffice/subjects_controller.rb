class AdminsBackoffice::SubjectsController < AdminsTemplateController

   def index
      @subjects = Subject.all.order(:description).page(params[:page]).per(20)
   end

   def new
      @subject = Subject.new
   end

   def create
      @subject = Subject.new(subject_params)
      if @subject.save
         redirect_to admins_backoffice_subjects_path, notice: "Assunto/Área criado com sucesso!"
      else 
         render :new 
      end
   end

   def edit
      @subject = Subject.find(params[:id])
   end

   def update 
      @subject = Subject.find(params[:id])
      if @subject.update(subject_params)
         flash[:notice] = "Assunto/Área atualizado com sucesso!"
         redirect_to admins_backoffice_subjects_path
      else 
         render :edit
      end
   end

   def destroy
      @subject = Subject.find(params[:id])
      if @subject.destroy
         redirect_to admins_backoffice_subjects_path, notice: "Assunto excluído com sucesso!"
      else
         render :index
      end
   end

   private 
      def subject_params()
         params.require(:subject).permit(:description)
      end
end
