class ApplicationController < ActionController::Base
  before_action :set_current_user

  private
  def set_current_user
    @current_user = session[:user_id] ? User.find_by(id: session[:user_id]) : nil
  end
end
