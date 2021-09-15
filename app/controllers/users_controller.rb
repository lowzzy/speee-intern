# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  def show; end

  # 委任契約合意アクション
  def delegation_contract
    case params[:agreed]
    when 'true'
      current_user.update(status: :delegation_agreed)
      redirect_to docs_agree_path
    when 'false'
      current_user.update(status: :cancel)
      redirect_to cancel_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :tel, :address, :password, :password_confirmation, :status)
  end

  def user_delegation_params
    params.require(:user).permit(:status)
  end
end
