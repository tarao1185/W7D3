class SessionsController < ApplicationController
  def new
    render :new
  end 

  def create
  @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
  log_in_user!(@user)
  redirect_to user_url(@user)
  end 

  def destroy
    sign_out!
    redirect_to new_session_url
  end

end
