# frozen_string_literal: true

# 都道府県名から都市を返してくれるAPIのアクション
module Api
  module V1
    class CitiesController < ActionController::Base
      require 'date'
      def index
        prefecture = Prefecture.find(params[:prefecture_id])
        cities = prefecture.cities.pluck(:name, :id)
        render json: { status: 'SUCCESS', message: 'Loaded cities', data: cities }
      end
    end
  end
end
