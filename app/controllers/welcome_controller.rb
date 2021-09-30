class WelcomeController < ApplicationController
  def index
    @questions = Question.includes(:answers).page(params[:page]).per(10)
  end
end
