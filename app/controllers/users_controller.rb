class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)

    #needed attr_reader for password

    if @user.save
      flash[:notice] = "User has been saved"
      redirect_to(root_url)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :user_name)
  end
end
