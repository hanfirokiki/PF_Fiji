class User::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit]

  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews.order(created_at: :desc).page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "変更が成功しました。"
      redirect_to mypage_path
    else
      render 'edit'
    end

  end

  def withdraw_confirm
    #@user = User.find(params[:id])
    @user = current_user
  end

  def withdraw
    @user = current_user
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @user.update(is_deleted: true)
    sign_out(@user)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :profile_image)
  end

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.email == User::GUEST_USER_EMAIL
      redirect_to root_path, notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end
end
