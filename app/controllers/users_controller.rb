class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    # byebug
    @user = User.new(user_params)
    if @user.save
      # byebug
      session[:user_id] = @user.id
      redirect_to root_path
    else
      # @user = User.new
      # byebug
      flash.now[:message] = @user.errors.full_messages.join(', ')
      render 'new'
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password, :owner)
  end
end