class Admin::QuestionsController < AdminController
  
  # GET /admin/questions
  def index
    @questions = Question.all.paginate :page=>params[:page]
  end
  
  # GET /admin/questions/:id
  def show
    @question = Question.find_by_permalink! params[:id]
  end
  
  # GET /admin/questions/new
  def new
    @question = Question.new
  end
  
  # POST /admin/questions
  def create
    @question = Question.new params[:question]
    @question.save!
    redirect_to admin_questions_url
  rescue ActiveRecord::RecordInvalid
    @questions = Question.all.paginate :page=>params[:page]
    render :new
  end
  
  # PUT /admin/questions/:id
  def update
    @question = Question.find_by_permalink! params[:id]
    @question.update_attributes! params[:question]
    redirect_to [:admin, @question]
  rescue ActiveRecord::RecordInvalid
    render :show
  end
  
end
