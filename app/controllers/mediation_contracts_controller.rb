# frozen_string_literal: true

class MediationContractsController < ApplicationController
  before_action :authenticate_user!

  # MediationContracには、Assessmentと同じ値が入る
  def create
    as = Assessment.where(user_id: current_user.id)
    as.each do |a|
      MediationContract.create(agency_id: a.agency_id, user_id: current_user.id, temp_price: a.temp_price)
    end
    redirect_to home_url
  end
end
