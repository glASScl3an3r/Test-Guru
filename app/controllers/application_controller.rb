# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_params, if: :devise_controller?

  def after_sign_in_path_for(user)
    user.is_a?(Admin) ? admin_tests_path : root_path
  end

  protected

  def configure_permitted_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])
  end
end
