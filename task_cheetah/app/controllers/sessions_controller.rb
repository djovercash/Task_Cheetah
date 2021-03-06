class SessionsController < ApplicationController
  skip_before_action :require_logged_in, only: [:new, :create]

  def new
    ##Top Cheetah Points
    @top_cheetah_points = User.top_cheetah_points

    ##Newest Created Task
    @newest_task = Task.all.sort_by { |task| task.created_at}.last

    #Top Cheetah Rating
    @top_user = User.top_user
  end

  def create
    user = User.find_by(username: params[:user][:username])

    if user.try(:authenticate, params[:user][:password])
      session[:user_id] = user.id
      @user = user
      redirect_to user_path(@user)
    else
      flash[:errors] = ["User Name or Password is incorrect. Please try again."]
      redirect_to login_path
    end
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end
end
