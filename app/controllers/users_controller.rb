# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  def show; end

  def update
    current_user.update(user_delegation_params)
  end

  # 委任契約同意アクション
  def delegation_contract
    if params[:is_agree] == "true"
      current_user.update(status: :delegation_agreed)
      redirect_to agree_path
    elsif params[:is_agree] == "false"
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
