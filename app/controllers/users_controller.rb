class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:alert] = 'Account Created Successfully !'
      redirect_to '/pictures'
    else
      flash.now[:error] = 'Sorry, Try Again !'
      render :new
    end
  end

  def user_params
    # { email: params[:user][:email], password: params[:user][:password], password_confirmation: params[:user][:password_confirmation]}
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
