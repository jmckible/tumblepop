class ApplicationController < ActionController::Base
  include AuthorizationSystem
  
  protect_from_forgery
  
  before_filter :try_login
end
