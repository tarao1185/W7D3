class UsersController < ApplicationController
  before_action :require_signed_in!, only: [:show, :index]

  def index 
    @users = User.all
    render :index
  end 

  def show
    @user = User.find(params[:id])
    render :show
  end 

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      sign_in!(@user)
      redirect_to users_url
    else
      flash[:errors] = @user.errors.full_messages
  end 

  def user_params
    params.require(:user).permit(:email, :password)
  end


end
