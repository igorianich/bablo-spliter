class ApplicationController < ActionController::Base
  include Pundit
  include Pundit::Authorization

  before_action :current_user

  private
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
