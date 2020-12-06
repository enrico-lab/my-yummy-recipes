class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :welcome ]

  def welcome
  end

  def profile
    @user = current_user
  end

  def update
    @user = current_user
    if @user.done == nil
      @user.done = Hash.new
    end
    @user.done["#{Date.today}"] = params[:user][:done]["#{Date.today}"]
    @user.save
    redirect_to dashboard_path
  end

  def home
  end

  private

  def user_params
    params.require(:user).permit( :done )
  end
end
