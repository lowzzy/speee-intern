# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  def show; end

  # 委任契約合意アクション
  def delegation_contract
    case params[:agreed]
    when 'true'
      current_user.update(status: :delegation_agreed)
      redirect_to docs_agree_path
    when 'false'
      redirect_to cancel_path
    end
  end

  # 鍵郵送合意アクション
  def docs_agree
    case params[:agreed]
    when 'true'
      current_user.update(status: :docs_agreed)
      redirect_to mailing_direction_path
    when 'false'
      redirect_to cancel_path
    end
  end

  # 机上査定結果を見た後
  # 一般媒介契約合意アクション
  def property_assessment
    case params[:agreed]
    when 'true'
      # サービスの利用に同意したら、statusを変更し、MediationContractをcreateする
      current_user.update(status: :mediation_agreed)
      current_user.assessments.each do |a|
        MediationContract.create(agency_id: a.agency_id, user_id: current_user.id, temp_price: a.temp_price)
      end
      redirect_to home_path
    when 'false'
      redirect_to cancel_path
    end
  end

  # キャンセル確定アクション
  def confirm_cancellation
    case params[:agreed]
    when 'true'
      current_user.update(status: :cancel)
    end
    redirect_to home_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :tel, :address, :password, :password_confirmation, :status)
  end

  def user_delegation_params
    params.require(:user).permit(:status)
  end
end
