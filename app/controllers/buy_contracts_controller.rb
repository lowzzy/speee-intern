# frozen_string_literal: true

class BuyContractsController < ApplicationController

  def create
    if BuyContract.where(id: current_user.id).present?
      flash[:info] = '既に売買契約を締結しています'
      redirect_to home_path
    else
      current_user.update!(status: :buy_contract_agreed)
      price = Offer.find_by(user_id: current_user.id,
                            candidate_buyer_id: params[:buyer_id].to_i)
                   .price

      BuyContract.create!(final_price: price,
                          candidate_buyer_id: params[:buyer_id].to_i,
                          user_id: current_user.id)
      redirect_to buy_contract_agreed_path
    end
  end
end
