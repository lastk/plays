class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == 'USERNAME' && password == 'PASSWORD'
    end
  end

  def define_current_user
    session['user_logged'] = true
  end
end
