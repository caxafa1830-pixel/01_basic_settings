class LogoutsController < ApplicationController
  def show
    session.delete(:user_id)
    redirect_to new_login_path, notice: "ログアウトしました"
  end
end


