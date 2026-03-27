require 'rails_helper'

RSpec.describe "Logouts", type: :request do
  let!(:user) { create(:user) }

  describe "GET /login/new" do
    it "正常に表示される" do
      get new_login_path
      expect(response.status).to eq 200

      expect(response.body).to match('ログイン')
      expect(response.body).to match('名前')
      expect(response.body).to match('パスワード')
    end
  end

  describe "POST /login" do
    context "名前とパスワードが適切な時" do
      it "ログインできる" do
        get root_path
        expect(response.body).not_to match(user.name)

        post login_path, params: { name: user.name, password: user.password }

        expect(response).to redirect_to(users_path)
        expect(flash[:notice]).to eq "ログインしました"

        get root_path
        expect(response.body).to match(user.name)
      end
    end

    context "名前とパスワードが不適切な時" do
      it "ログインできない" do
        post login_path, params: { name: 'test_name', password: user.password }
        expect(response.body).to match('ログイン')
        expect(response.body).to match('名前')
        expect(response.body).to match('パスワード')
      end
    end
  end

  describe "GET /logout" do
    before {
      post login_path, params: { name: 'test_name', password: user.password }
    }

    it "ログアウトできる" do
      get logout_path
      expect(response.status).to eq 302
      expect(response).to redirect_to(root_path)

      get users_path
      expect(response.body).to match('ログイン')
    end
  end
end
