class ApplicationController < ActionController::Base
  include Pundit
  # after_filter :verify_authorized, :except => :index
  # after_filter :verify_policy_scoped, :only => :index
  protect_from_forgery

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:error] = "You are not authorized to perform this action."
    redirect_to request.headers["Referer"] || root_path
  end
end
