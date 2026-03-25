class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :set_index_title, only: :index
  before_action :set_show_title, only: :show

 # GET /users or /users.json
 def index
  @users = User.where(age: 20..50).order(age: :desc)
end 

  # GET /users/1 or /users/1.json
  # GET /users/new
  def new
  @user = User.new(name: 'らんてくん', age: 20)
end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "ユーザーの新規登録に成功しました" }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "ユーザーの更新に成功しました" }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # 共通処理: 指定ユーザーを取得
  def set_user
    @user = User.find(params[:id])
  end

  # Strong Parameters
  def user_params
    params.require(:user).permit(:name, :age)
  end

  # ビュー用タイトル
  def set_index_title
    @index_title = 'ユーザー一覧'
  end

  def set_show_title
    @show_title = 'ユーザー詳細'
  end
end
