class UserPagesController < ApplicationController
  before_action :authenticate_user!
  def home
  end

  def agree
  end
end
