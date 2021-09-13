# frozen_string_literal: true

module Admin
  class AgenciesController < AdminController
    def index
      @agencies = Agency.all
    end

    def new
      @agency = Agency.new
    end

    def create
      @agency = Agency.new(agency_params)
      if @agency.save
      else
        # エラーの場合の処理
        redirect_to admin_agencies_path
      end
    end

    def agency_params
      params.require(:agency).permit(:name, :email, :tel, :address)
    end
  end
end
