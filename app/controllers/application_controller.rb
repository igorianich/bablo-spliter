class ApplicationController < ActionController::Base
  include Pundit
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError do |e|
    render_errors(e.message, :forbidden)
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  private

  def render_errors(errors, status = :unprocessable_entity)
    render json: { errors: errors }, status: status
  end

  # def require_user_logged_in!
  #   redirect_to sign_in_path, alert: 'You must be signed in to do that.' unless current_user
  # end
end
