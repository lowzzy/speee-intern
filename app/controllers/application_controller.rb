# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    case resource
    #   when User
    #     #   admin_pages_home_path
    #     root
    when AdminUser
      # AdminPages コントローラーで作ったhomeページへのpath
      admin_pages_path
    end
  end
end
