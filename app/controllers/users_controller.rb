class UsersController < ApplicationController
  before_action :check_user_login, only: :show

  def show
  	@user = User.find(params[:id])
    @upcoming_hosted_event_feed = @user.hosted_events.upcoming
    @past_hosted_event_feed = @user.hosted_events.past
    @upcoming_attending_event_feed = @user.confirmed_events.upcoming
    @past_attending_event_feed = @user.confirmed_events.past
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      login @user
  		flash[:success] = "Account successfully created!"
  		redirect_to @user
  	else
  		flash.now[:danger] = "User signup failed."
  		render 'new'
  	end
  end

  private

    def user_params
    	params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def check_user_login
      if !logged_in?
        flash[:info] = "You must first log in to complete this action."
        redirect_back(fallback_location: root_url)
      end
    end

end
