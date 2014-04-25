class SessionsController < ApplicationController

  before_action :require_current_user!, except: [:create, :new]
  before_action :require_logged_out_user!, only: [:create, :new]

  def new
    @user = User.new

    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user])
    if @user
      login!(@user)
      redirect_to root_url
    else
      flash.now[:errors] = ["Invalid username and/or password."]
      @user = User.new
      @user.user_name = params[:user][:user_name]
      render :new
    end
  end

  def destroy
    logout!
    redirect_to root_url
  end

end
