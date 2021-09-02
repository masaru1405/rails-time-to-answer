class AdminsBackoffice::QuestionsController < AdminsTemplateController

   def index
      @questions = Question.includes(:subject).order(:id).page(params[:page]).per(15)
      @total = Question.all.size
   end

   def new
      @question = Question.new
      @subjects = Subject.all
   end

   def create
      @question = Question.new(question_params)
      if @question.save
         flash[:success] = "Questão criado com sucesso!"
         redirect_to admins_backoffice_questions_path
      else 
         render :new
      end
   end

   def edit
      @question = Question.find(params[:id])
      @subjects = Subject.all
   end

   def update 
      @question = Question.find(params[:id])
      if @question.update(question_params)
         flash[:success] = "Questão atualizado com sucesso!"
         redirect_to admins_backoffice_questions_path
      else 
         render :edit
      end
   end

   def destroy
      @question = Question.find(params[:id])
      question_deleted = @question.id
      if @question.destroy
         flash[:danger] = "Questão de código #{question_deleted} excluída!"
         redirect_to admins_backoffice_questions_path
      else 
         render :index
      end
   end

   private 
      def question_params()
         params.require(:question).permit(:description, :subject_id, answers_attributes: [:id, :description, :correct, :_destroy])
      end
end
