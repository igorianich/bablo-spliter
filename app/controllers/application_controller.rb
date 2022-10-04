class ApplicationController < ActionController::Base
  include Pundit
  include Pundit::Authorization

  before_action :current_user

  private
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def require_user_logged_in!
    redirect_to sign_in_path, alert: 'You must be signed in to do that.' unless current_user
  end
end
