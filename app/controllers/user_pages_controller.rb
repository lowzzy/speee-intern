# frozen_string_literal: true

class UserPagesController < ApplicationController
  before_action :authenticate_user!
  def home
    @user_status = current_user.status
  end

  # 鍵郵送合意アクション
  def docs_agree
    case params[:agreed]
    when 'true'
      current_user.update(status: :docs_agreed)
      redirect_to home_path
    when 'false'
      current_user.update(status: :cancel)
      redirect_to cancel_path
    end
  end

  def cancel; end
end
