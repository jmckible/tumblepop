class SessionsController < ApplicationController
  
  # GET /login
  def login
  end
  
  # POST /authorize
  def authorize
    if user = User.authenticate(params[:email], params[:password])
      login_as user
      redirect_to session[:return_to] || root_url
    else
      flash[:notice] = 'Invalid credentials'
      redirect_to login_url
    end
  end
  
  # ANY /logout
  def logout
    reset_session
    redirect_to root_url
  end
  
end
