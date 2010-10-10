class AdminController < ApplicationController
  layout 'admin'
  
  before_filter :admin_required
  
  # GET /admin
  def index
  end
  
end
