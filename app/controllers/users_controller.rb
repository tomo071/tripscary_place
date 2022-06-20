class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user=User.find(current_user.id)
  end

  def withdrawal
    @user = User.find(current_user.id)
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  def edit
    @user=User.find(current_user.id)
  end

  def updated
    @user=User.find(current_user.id)
    @user.update(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :is_deleted, :password)
  end
end
