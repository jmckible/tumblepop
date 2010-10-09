class Admin::QuestionsController < ApplicationController
  
  # GET /admin/questions
  def index
    @questions = Question.all
  end
  
end
