# frozen_string_literal: true

module Api
  module V1
    class PrefecturesController < ActionController::Base
      def list
        @prefecture_list = Prefecture.pluck(:name)
        render json: { status: 'SUCCESS', message: 'Loaded cities', data: @prefectures_list }
      end
    end
  end
end
