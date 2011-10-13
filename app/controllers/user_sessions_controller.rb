class UserSessionsController < ApplicationController

  before_filter :is_demo_instance?

  def new
    current_user_session.try(:destroy)
    @user_session = UserSession.new
    @user_session.email = params['email']
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    
    if @user_session.save
      flash[:notice] = "Logged in successfully"
      redirect_to root_path
    else
      flash.now[:error] = "Error logging in"
      render :action => "new"
    end
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful"
    options = @demo ? {:email => "help@amee.com"} : nil
    redirect_to new_user_session_path(options)
  end 
end