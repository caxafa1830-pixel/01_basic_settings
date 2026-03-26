class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :set_index_title, only: :index
  before_action :set_show_title, only: :show

  def index
    @users = User.where(age: 20..50).order(age: :desc)
  end

  def show
  end

  def new
    @user = User.new(name: 'らんてくん', age: 20)
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_url(@user), notice: "ユーザーの新規登録に成功しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_url(@user), notice: "ユーザーの更新に成功しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: "User was successfully destroyed."
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :age, :tel)
  end

  def set_index_title
    @index_title = 'ユーザー一覧'
  end

  def set_show_title
    @show_title = 'ユーザー詳細'
  end
end