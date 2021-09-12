# frozen_string_literal: true

class AgenciesController < ApplicationController
  def home
    @agencies = Agency.all
  end

  def registration; end

  def create
    @agency = Agency.create(agency_params)
  end

  def agency_params
    params.permit(:name, :email, :tel, :address)
  end
end
