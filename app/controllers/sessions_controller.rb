class SessionsController < ApplicationController

  def new 
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      
    else
      flash.now[:notice] = "There was something wrong with your login information."
      render 'new'
    end
  end

  def destroy
  end

end
