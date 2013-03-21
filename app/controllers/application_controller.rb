class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    message = Rails.env.production? ? exception.message : "Action: #{exception.action}, Subject: #{exception.subject}, Message: #{exception.message}"
    redirect_to root_path, alert: message
  end
end
