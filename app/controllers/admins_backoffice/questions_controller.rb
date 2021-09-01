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
         redirect_to admins_backoffice_questions_path, notice: "Questão criado com sucesso!"
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
         flash[:notice] = "Questão atualizado com sucesso!"
         redirect_to admins_backoffice_questions_path
      else 
         render :edit
      end
   end

   private 
      def question_params()
         params.require(:question).permit(:description, :subject_id)
      end
end
