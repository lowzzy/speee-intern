# frozen_string_literal: true

class MediationContractsController < ApplicationController
  before_action :authenticate_user!
  def new
    @mediation_contract = MediationContract.new
  end

  def create
    @mediation_contract = MediationContract.new
    @mediation_contract.user = current_user

    if @mediation_contract.save
      flash[:info] = '手続き継続に合意しました'
      redirect_to user_pages_home_url
    else 
      redirect_to mediation_contract_new_url
    end
  end
end
