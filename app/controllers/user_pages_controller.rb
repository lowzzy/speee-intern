# frozen_string_literal: true

class UserPagesController < ApplicationController
  before_action :authenticate_user!
  def home
    @user_status = current_user.status
  end

  def docs_agree; end

  def cancel; end
end
