class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:current_user_id] = @user.id
      flash[:notice] = 'welcome!'
      redirect_to root_url
    else
      flash[:notice] = 'there was a problem, please try again'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
