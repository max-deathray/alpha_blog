class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "You have successfully logged in"
      redirect_to user_path(user)
    else
      flash.now[:notice] = "There was something wrong with your login information"
      render 'new'
    end
  end

  def destroy

    if session[:user_id].present?
      session[:user_id] = nil
      flash[:notice] = "You have logged out"
      redirect_to root_path
    else
      flash[:notice] = "You were not logged in yet."
      render 'new'
    end
  end

end
