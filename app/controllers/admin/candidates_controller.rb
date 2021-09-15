# frozen_string_literal: true

module Admin
  class CandidatesController < AdminController
    require 'date'
    # Get 買い手候補登録画面
    def new
      @candidate_buyer = CandidateBuyer.new
      @offer = @candidate_buyer.build_offer
    end

    # Post 買い手候補登録
    def create
      @candidate_buyer = CandidateBuyer.new(candidate_params)
      @offer = @candidate_buyer.build_offer(offer_params)

      if @candidate_buyer.save
        @candidate_buyer.offer.update(transacted_on: datetime_params)

        flash[:success] = '買い手登録を完了しました。'
        redirect_to admin_candidates_show_path
      else
        # エラーだったら買い手候補ページに飛ぶようにする。
        redirect_to admin_candidates_path
        flash[:danger] = '買い手を登録できませんでした。'
      end
    end

    # Get 買い手を全て表示する画面(テスト用)
    def show
      @candidate_all = CandidateBuyer.all
    end

    private

    def candidate_params
      params.require(:candidate_buyer).permit(:name, :address, :hearing)
    end

    def offer_params
      params.require(:candidate_buyer).permit(:price, :transacted_on)
    end

    def datetime_params
      params_buyer = params['candidate_buyer']
      time1 = params_buyer['transacted_on(1i)']
      time2 = params_buyer['transacted_on(2i)']
      time3 = params_buyer['transacted_on(3i)']
      time4 = params_buyer['transacted_on(4i)']
      time5 = params_buyer['transacted_on(5i)']
      datetime = "#{time1}-#{time2}-#{time3} #{time4}:#{time5}"
      DateTime.parse(datetime)
    end
  end
end
