# frozen_string_literal: true

module Admin
  class CandidatesController < AdminController
    before_action :authenticate_admin_user!
    # Get 買い手候補登録画面
    def new
      @candidate_buyer = CandidateBuyer.new
      @offer = @candidate_buyer.build_offer
      @users_name_id = User.pluck(:name, :id)
    end

    # Post 買い手候補登録
    def create
      @candidate_buyer = CandidateBuyer.new(candidate_params)
      @offer = @candidate_buyer.build_offer(offer_params)
      @offer.update(user_id: user_params[:user_id])

      if @candidate_buyer.save && @offer.save
        flash[:success] = '買い手登録を完了しました。'
        redirect_to new_admin_candidate_path
      else
        # エラーだったら買い手候補ページに飛ぶようにする。
        redirect_to admin_candidates_path
        flash[:danger] = '買い手を登録できませんでした。'
      end
    end

    # Get 買い手を全て表示する画面(テスト用)
    def index
      @candidate_all = CandidateBuyer.all
    end

    def user_select
      @users = User.all
    end

    private

    def candidate_params
      params.require(:candidate_buyer).permit(:name, :address, :hearing)
    end

    def offer_params
      params.require(:candidate_buyer).permit(:price, :transacted_on)
    end

    def user_params
      params.require(:candidate_buyer).permit(:user_id)
    end
  end
end
