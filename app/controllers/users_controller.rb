class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = user.new(user_params)

    if @user.save
      redirect_to '/pictures'
    else
      render :new
    end
  end

  def user_params
    { email: params[:user][:email], password: params[:user][:password], password_confirmation: [:user][:password_confirmation]}
  end

end
