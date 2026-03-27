class LoginsController < ApplicationController
  def new
    # ログインフォーム表示（中身は空でOK）
  end

  def create
    user = User.find_by(name: params[:name])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to users_path, notice: "ログインしました"
    else
      flash.now[:alert] = "ログインに失敗しました"
      render :new, status: :unprocessable_entity
    end
  end
end


