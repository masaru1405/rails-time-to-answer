class AnswerController < ApplicationController

   def question
      @answer = Answer.find(params[:answer_id])

      #Model UserStatistic
      UserStatistic.set_statistic(@answer, current_user, user_signed_in?)

   end
end
