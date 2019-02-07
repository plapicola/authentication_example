class Users::UsersController < ApplicationController

  before_action :require_login

  def show
  end

  private

  def require_login
    @user = User.find(session[:user]) if session[:user]
    unless @user
      redirect_to login_path
    end
  end
end
