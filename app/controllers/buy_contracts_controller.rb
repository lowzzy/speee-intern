# frozen_string_literal: true

class PropertiesController < ApplicationController
    def new; end
  
    def create
        if params[:agreement]
            @current_user.update!(status: :buy_contract_agreed)
            contract = BuyContract.new(buy_contract_params)
            # price = Offer.find_by(user_id: params[:user_id],
            #                       buyer_id: params[:buyer_id])
            #               .price
            # contract.update!(final_price: price)
            contract.update!(final_price: 1)
            redirect_to buy_contract_agreed_path
        elsif params[:agreement] == false
            redirect_to home_path
        end
    end

    private

    def buy_contract_params
        params.require(:buy_contract)
              .permit(:user_id, :buyer_id)
    end
  end
