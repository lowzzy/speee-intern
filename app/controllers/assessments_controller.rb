# frozen_string_literal: true

class AssessmentsController < ApplicationController
  before_action :authenticate_user!
  def show
    @assessments = Assessment.where(user_id: current_user.id)
  end
end
