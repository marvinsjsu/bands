class UsersController < ApplicationController

  def index
    @users = User.all
    render :index, locals: {users: @users}
  end

  def show
    @user = User.find_by_email(params[:id])
    render :show
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:session_token] = @user.session_token
      redirect_to users_url
    else
      flash[:error] = @user.errors.messages
      render :new, locals: {user: @user}
    end
  end

  def destroy
    @user = User.find_by_email(params[:id])
    @user.destroy!
  end
end
