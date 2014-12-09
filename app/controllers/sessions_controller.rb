class SessionsController < ApplicationController

  def new
  end

  def login
    @user = User.find(params[:email])
    if @user.password == params[:password]
      session[:user_id] = user.id
    else
      redirect_to root_url
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

end
