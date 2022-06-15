class UsersController < ApplicationController
  def show
    @user=User.find(current_user.id)

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
    params.require(:user).permit(:name, :email)
  end
end
