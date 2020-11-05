class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def render_errors(errors, status = :internal_server_error)
    render json: { errors: errors }, status: status
  end
end
