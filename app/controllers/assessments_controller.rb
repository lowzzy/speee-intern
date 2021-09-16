# frozen_string_literal: true

class AssessmentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @assessments = current_user.assessments
  end
end
