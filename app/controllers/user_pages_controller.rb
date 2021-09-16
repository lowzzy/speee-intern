# frozen_string_literal: true

class UserPagesController < ApplicationController
  before_action :authenticate_user!
  def home
    @user_status = current_user.status
  end

  def cancel; end

  def agree_buy_contract; end
  def mailing_direction; end
end
