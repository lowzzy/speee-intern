# frozen_string_literal: true

module Admin
  class AgenciesController < ApplicationController
    def index
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
end
