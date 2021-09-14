# frozen_string_literal: true

class UserPagesController < ApplicationController
  before_action :authenticate_user!
  def home
    @user_status = status_text
  end

  def agree; end

  def status_text
    case current_user.status
    when 'account_created'
      @user_status = 'サービスへの売却委任契約に同意する'
    when 'delegation_agreed'
      @user_status = '鍵と書類の郵送に同意する'
    when 'docs_agreed'
      @user_status = '書類郵送中。届いたら返送する'
    when 'docs_sent'
      @user_status = '書類郵送中。が届いたら返送する'
    when 'docs_returned'
      @user_status = '不動産会社選定中/机上査定中'
    when 'agency_selected'
      @user_status = '不動産会社選定中/机上査定中'
    when 'property_assessed'
      @user_status = '査定結果を確認し、手続き継続に同意する'
    when 'mediation_agreed'
      @user_status = '不動産会社との契約手続き中'
    when 'mediation_signed'
      @user_status = '物件売り出し中'
    when 'candidate_found'
      @user_status = '買い手候補がいます！確認してみましょう'
    when 'candidate_chosen'
      @user_status = '売買契約の手続き継続に同意する'
    when 'buy_contract_agreed'
      @user_status = '売買契約手続き中'
    when 'buy_contract_signed'
      @user_status = '入金待ち/引き取り待ち'
    when 'all_completed'
      @user_status = '売却完了'
    end
  end
end
