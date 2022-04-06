class UsersController < ApplicationController

  before_action :require_logged_out, only: [:new, :create]

  def new
    @user ||= User.new
    render :new
  end

  def create
    @user = User.new(email: params[:user][:email])
    @user.password = params[:user][:password]
    if @user.save
      login(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find_by(id:params[:id])
    if @user
      render :show
    else
      render :new
    end
  end
end
