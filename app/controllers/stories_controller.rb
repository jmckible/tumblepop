class StoriesController < ApplicationController
  
  # GET /
  def index
    @stories = Story.all.paginate :page=>params[:page]
  end
  
end
