# frozen_string_literal: true

class AssessmentsController < ApplicationController
  before_action :authenticate_user!
  def index
    @assessments = Assessment.where(user_id: current_user.id)
  end
end
