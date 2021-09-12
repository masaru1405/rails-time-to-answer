class SearchController < ApplicationController

   def questions
      @questions = Question._search_(params[:term]).page(params[:page]).per(20)
      #@questions = Question.search_pagination(params[:term], params[:page], 20)
   end

   def subject
      @questions = Question._search_subject_(params[:subject_id]).page(params[:page]).per(20)
   end
end
