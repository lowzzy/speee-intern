# frozen_string_literal: true

module Admin
  class AssessmentsController < ApplicationController
    before_action :authenticate_admin_user!
    # Get 査定結果登録画面
    def new
      @assessment = Assessment.new
    end

    # Post 査定結果登録登録
    def create
      property = User.find(params[:assessment][:user_id].to_i)
      @assessment = Assessment.new(user_id: params[:assessment][:user_id].to_i,
                                   agency_id: params[:assessment][:agency_id],
                                   property_id: property.id,
                                   temp_price: params[:assessment][:temp_price])

      if @assessment.save
        flash[:success] = '査定結果登録を完了しました。'
      else
        flash[:danger] = '買い手を登録できませんでした。'
      end
      redirect_to new_admin_assessment_path
    end

    # Get 査定結果を全て表示する画面(テスト用)
    def index
      @assessments = Assessment.all
    end

    private

    def assessment_params
      params.require(:assessment).permit(:user_id, :agency_id, :temp_price)
    end
  end
end
