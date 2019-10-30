class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  def current_user
    session[:user_id] = nil if User.find_by(id: session[:user_id]).blank?
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end
