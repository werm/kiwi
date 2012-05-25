class ApplicationController < ActionController::Base
  protect_from_forgery

  check_authorization
  rescue_from CanCan::AccessDenied do |exc|
    redirect_to root_path, alert: exc.message
  end

  private

  def current_user
    true
  end
end
