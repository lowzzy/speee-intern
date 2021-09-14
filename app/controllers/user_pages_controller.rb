# frozen_string_literal: true

class UserPagesController < ApplicationController
  before_action :authenticate_user!
  def home; end

  def agree; end

  def cancel; end
end
