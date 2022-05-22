class UsersController < ApplicationController
  def show
    @user=User.find(params[:id])
  end

  def edit
    @user=User.find(params[:id])
  end
  
  def updated
    @user=User.find(params[:id])
    @user.update(user_params)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
