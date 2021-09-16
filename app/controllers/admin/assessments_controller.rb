# frozen_string_literal: true

module Admin
  class AssessmentsController < ApplicationController
    before_action :authenticate_admin_user!
    def index
      @assessments = Assessment.where(user_id: current_user.id)
    end

    def new; end
  end
end
