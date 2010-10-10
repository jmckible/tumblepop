module AuthorizationSystem
  attr_accessor :current_user
  
  def self.included(base)
    base.__send__ :helper_method, :logged_in?, :admin_logged_in?
    base.__send__ :helper_method, :current_user
  end
  
  protected
  def login_as(user)
    return if user.nil?
    @current_user = user
    session[:user_id] = user.id
  end
  
  def logged_in?
    current_user
  end
  
  def admin_logged_in?
    current_user && current_user.admin?
  end
  
  def try_login
    session_login || true
  end
  
  def user_required
    access_denied unless session_login && logged_in?
  end
  
  def admin_required
    access_denied unless session_login && admin_logged_in?
  end
  
  def access_denied
    session[:return_to] = request.url
    redirect_to login_url and return false
  end
  
  def session_login
    login_as(User.find(session[:user_id])) if session[:user_id]
  end
  
end