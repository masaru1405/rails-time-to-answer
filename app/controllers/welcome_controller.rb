class WelcomeController < ApplicationController
  def index
    @questions = Question.includes(:answers).page(params[:page]).per(20)
  end
end
