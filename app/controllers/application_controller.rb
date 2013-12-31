class ApplicationController < ActionController::Base
  include Pundit
  after_filter :verify_authorized, :except => :index
  after_filter :verify_policy_scoped, :only => :index
  protect_from_forgery
end
