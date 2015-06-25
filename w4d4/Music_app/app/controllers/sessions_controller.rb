class SessionsController < ApplicationController
  before_action :require_no_user!, only: [:create, :new]

  def new
    @user = User.new
    render :new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )
    if user.nil?
      flash.now[:errors] = ["Incorrect email or password"]
      render :new
    else
      log_in_user!(user)
      redirect_to bands_url
    end
  end

  def destroy
    log_out_user!
    redirect_to new_session_url
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
