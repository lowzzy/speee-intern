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
      flash[:info] = if @agency.save
                       # price画面で'登録が完了しました'と表示される
                       '登録が完了しました'
                     else
                       "入力に誤りが含まれています : #{@agency.errors.full_messages.join('. ')}"
                     end
      redirect_to new_admin_agency_path
    end

    def agency_params
      params.require(:agency).permit(:name, :email, :tel, :address)
    end
  end
end
