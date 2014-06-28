class SessionsController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(user_params[:email], user_params[:password])
    if @user.nil?
      flash[:error] = @user.errors.messages
      render :new
    else
      log_in_user!
      redirect_to bands_url
    end
  end

  def destroy
    session[:session_token] = nil
    redirect_to users_url
  end
end