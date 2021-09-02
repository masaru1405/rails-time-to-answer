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
         flash[:success] = "Assunto/Área criado com sucesso!"
         redirect_to admins_backoffice_subjects_path
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
         flash[:success] = "Assunto/Área atualizado com sucesso!"
         redirect_to admins_backoffice_subjects_path
      else 
         render :edit
      end
   end

   def destroy
      @subject = Subject.find(params[:id])
      subject_deleted = @subject.description
      if @subject.destroy
         flash[:danger] = "#{subject_deleted} excluído!"
         redirect_to admins_backoffice_subjects_path
      else
         render :index
      end
   end

   private 
      def subject_params()
         params.require(:subject).permit(:description)
      end
end
