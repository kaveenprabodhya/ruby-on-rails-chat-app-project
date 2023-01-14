class SessionsController < ApplicationController
  before_action :logged_in_redirect, only: [:new, :create]

    def new
    end
    
    def create
      @user = User.find_by(username: params[:session][:username].downcase)
      if @user && @user.authenticate(params[:session][:password])
          session[:user_id] = @user.id
          flash[:success] = 'You have successfully logged in.'
          redirect_to root_path
      else
          flash[:negative] = 'Invalid username or password!'
          redirect_to login_path
      end
    end
    
    def destroy
      session[:user_id] = nil
      redirect_to login_path, status: :see_other
      flash[:success] = 'You have successfully logged out.'
  end

  private
    def user_params
      params.require(:user).permit(:username, :password)
    end

    def logged_in_redirect
      if logged_in?
        flash[:error] = "You are already logged in."
        redirect_to root_path
      end
    end

end
