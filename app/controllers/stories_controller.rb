class StoriesController < ApplicationController
  
  # GET /
  def index
    @stories = Story.newest.paginate :page=>params[:page]
  end
  
  # GET /stories/:id
  def show
    @story = Story.find_by_permalink params[:id]
  end
  
end
