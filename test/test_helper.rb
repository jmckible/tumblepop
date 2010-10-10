ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  fixtures :all

  def login(user)
    @current_user = users(user)
    @request.session[:user_id] = @current_user.id
  end
  
end
