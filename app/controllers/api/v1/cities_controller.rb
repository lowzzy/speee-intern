# frozen_string_literal: true

module Api
  module V1
    class CitiesController < ActionController::Base
      def list
        @prefecture = Prefecture.find(params[:prefecture_id])
        @cities_list = @prefecture.cities.pluck(:name, :id)
        render json: { status: 'SUCCESS', message: 'Loaded cities', data: @cities_list }
      end
    end
  end
end
