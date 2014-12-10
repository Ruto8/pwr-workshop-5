class SessionsController < ApplicationController

  def new
  end

  def login
    @user = User.find_by_email(params[:email])
    if  @user.password == params[:password]
      session[:user_id] = @user.id
      redirect_to root_url
    else
      redirect_to root_url
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

end
