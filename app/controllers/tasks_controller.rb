class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]

  # タスク一覧
  def index
    @tasks = Task.all
  end

  # タスク詳細
  def show
  end

  # 新規作成フォーム
  def new
    @task = Task.new
  end

  # タスク作成
  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to @task, notice: "タスクの新規登録に成功しました"
    else
      flash.now[:alert] = "タスクの作成に失敗しました"
      render :new, status: :unprocessable_entity
    end
  end

  # 編集フォーム
  def edit
  end

  # タスク更新
  def update
    if @task.update(task_params)
      redirect_to @task, notice: "タスクを更新しました"
    else
      flash.now[:alert] = "更新に失敗しました"
      render :edit, status: :unprocessable_entity
    end
  end

  # タスク削除
  def destroy
    @task.destroy
    redirect_to tasks_path, notice: "タスクを削除しました"
  end

  private

  # 共通処理: IDからタスクを取得
  def set_task
    @task = Task.find(params[:id])
  end

  # 許可するパラメータ
  def task_params
    params.require(:task).permit(:title, :description, :due_date)
  end
end
