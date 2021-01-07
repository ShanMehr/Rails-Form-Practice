class UsersController < ApplicationController
# app/controllers/users_controller.rb
def create
    @user = User.new(username: params[:username], email: params[:email], password: params[:password])
  
    if @user.save
      redirect_to new_user_path
    else
      render :new
    end
  end

  def new
    @user=User.new
  end

  def whitelisted_post_params
    params.require(:user).permit(:username,:email,:password)
  end
end
