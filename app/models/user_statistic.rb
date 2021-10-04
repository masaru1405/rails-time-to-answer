class UserStatistic < ApplicationRecord
  belongs_to :user

   #virtual attributes
   def total_questions
    self.correct_questions + self.incorrect_questions
  end

  #class method
  def self.set_statistic(answer, current_user, user_signed_in)
    if user_signed_in
      user_statistic =  UserStatistic.find_or_create_by(user: current_user)
       if answer.correct?
          user_statistic.correct_questions += 1
       else 
          user_statistic.incorrect_questions += 1
       end
       user_statistic.save
    end
  end

end
