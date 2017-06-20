class SessionsController < ApplicationController
  def new
  end

  def create
    u = User.find_by(email: params[:email])

    if u && u.authenticate(params[:password])
      session[:user_id] = u.id
      flash[:notice] = 'Successfully Logged in !'
      redirect_to root_url
    else
      flash.now[:alert] = 'Try Again !'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged Out!"
  end

end
