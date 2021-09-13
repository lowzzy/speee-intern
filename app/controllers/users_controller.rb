# frozen_string_literal: true

class UsersController < ApplicationController
  def show; end

  def user_params
    params.permit(:name, :email, :tel, :address, :password, :password_confirmation)
  end
end
