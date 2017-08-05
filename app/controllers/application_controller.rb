class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # KsK Added from here
  before_action :configure_permitted_parameters, if: :devise_controller?

  PERMISSIBLE_ATTRIBUTES = %i(name)

  protected
    def configure_permitted_parameters
      Rails.logger.info "configure_permitted_parameters in"
      devise_parameter_sanitizer.permit(:sign_up,        keys: PERMISSIBLE_ATTRIBUTES)
      devise_parameter_sanitizer.permit(:account_update, keys: PERMISSIBLE_ATTRIBUTES)
    end
  # KsK Added to here
end
