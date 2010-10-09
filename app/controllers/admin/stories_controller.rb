class Admin::StoriesController < Admin::AdminController
  
  # GET /admin/stories
  def index
    @stories = Story.all.paginate :page=>params[:page]
  end
  
  # GET /admin/stories/:id
  def show
    @story = Story.find_by_permalink! params[:id]
  end
  
  # PUT /admin/stories
  def update
    @story = Story.find_by_permalink! params[:id]
    @story.update_attributes! params[:story]
    redirect_to [:admin, @story]
  rescue ActiveRecord::RecordInvalid
    render :show
  end
  
end
