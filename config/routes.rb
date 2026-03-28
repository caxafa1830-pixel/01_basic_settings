# config/routes.rb
Rails.application.routes.draw do
  resources :users          # ユーザー一覧や詳細など
  resources :tasks          # タスク一覧・作成・編集・削除などのルーティング
  root 'top#index'          # トップページ
  resource :login, only: %i[new create]   # ログイン用ルーティング
  resource :logout, only: %i[show]       # ログアウト用ルーティング
  resources :welcomes, only: :index       # ウェルカムページ
end
