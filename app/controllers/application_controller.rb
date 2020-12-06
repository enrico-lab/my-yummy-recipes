class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :address, :username, :photo])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :first_name, :last_name, :address, :username, :photo] )
  end

  # app/controllers/application_controller.rb
  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end
end
