# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # sign_upのときに、Viewからname, address, telの値を受け取る
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:address])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:tel])
  end

  def after_sign_in_path_for(resource)
    case resource
    #   when User
    #     #   admin_pages_home_path
    #     root
    when AdminUser
      # AdminPages コントローラーで作ったhomeページへのpath
      admin_root_path
    end
  end
end
