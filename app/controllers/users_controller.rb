class UsersController < ApplicationController
  before_filter :user_required
  
  # GET /settings
  def show
    @user = current_user
  end
  
  # PUT /settings
  def update
    @user = current_user
    @user.update_attributes! params[:user]
    redirect_to user_url
  rescue ActiveRecord::RecordInvalid
    render :show
  end
  
end
