class SessionsController < ApplicationController

  def login
  end

  def authenticate
    @user = User.authenticate(login_params[:email], login_params[:password])
    if @user
      session[:user] = @user.id
      redirect_to users_path
    else
      render :login
    end
  end

  def logout
    session.delete(:user)
    redirect_to users_path
  end


  private

  def login_params
    params.require(:login).permit(:email, :password)
  end
end
