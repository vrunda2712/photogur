class SessionsController < ApplicationController
  def new
  end

  def create
    u = User.find_by(email: params[:session][:email])

    if u && u.authenticate(params[:session][:password])
      flash[:notice] = 'Successfully Logged in !'
    else
      flash.now[:alert] = 'Try Again !'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to pictures_url, notice: "Logged Out!"
  end
end
