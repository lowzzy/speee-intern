# frozen_string_literal: true

module Admin
  class UsersController < AdminController
    def index
      @users = User.all
    end

    def update
      user = User.find(params[:id])
      if user.all_completed?
        flash[:info] = '最終ステータスなのでアップデートできません'
        redirect_to admin_users_path
        return
      end
      flash[:info] = if user.update!(status: User.statuses[user.status] + 1)
                       'ステータスをアップデートしました'
                     else
                       'ステータスがアップデートできませんでした'
                     end
      redirect_to admin_users_path
    end
  end
end
