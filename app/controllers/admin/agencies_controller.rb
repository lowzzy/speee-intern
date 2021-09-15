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
        # price画面で'登録が完了しました'と表示される
        flash[:info] = '登録が完了しました'
        redirect_to new_admin_agency_path
      else
        flash[:info] = "入力に誤りが含まれています : #{@agency.errors.full_messages.join('. ')}"
        redirect_to new_admin_agency_path
      end
    end

    def agency_params
      params.require(:agency).permit(:name, :email, :tel, :address)
    end
  end
end
