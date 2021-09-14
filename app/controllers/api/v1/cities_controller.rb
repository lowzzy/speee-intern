# frozen_string_literal: true

module Api
  module V1
    class CitiesController < ActionController::Base
      def index
        prefecture = Prefecture.find(params[:prefecture_id])
        cities = prefecture.cities.pluck(:name, :id)
        render json: { status: 'SUCCESS', message: 'Loaded cities', data: cities }
      end
    end
  end
end
