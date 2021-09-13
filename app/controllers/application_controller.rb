# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    case resource
    when User
      user_pages_home_path
    when AdminUser
      # AdminPages コントローラーで作ったhomeページへのpath
      admin_root_path
    end
  end
end
