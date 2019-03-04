class SessionsController < ApplicationController

  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email])
  	if user && user.authenticate(params[:session][:password])
  		login user
  		flash[:success] = "Welcome back, #{user.name}!"
  		redirect_to user
  	else
  		flash.now[:danger] = "Incorrect user/password combination"
  		render 'new'
  	end
  end

  def destroy
  	logout if logged_in?
  	redirect_to root_url
  end

end
