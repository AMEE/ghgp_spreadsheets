# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  
  protect_from_forgery
  
  include AMEE::Authentication::AuthHelper
  include ApplicationHelper
  helper_method :current_user_session, :current_user, :logged_in?, :admin_login_required
  
  def home
    if logged_in?
      redirect_to summary_path
    else
      redirect_to login_path
    end
  end

  def help
    if logged_in?
      render 'layouts/help'
    else
      redirect_to login_path
    end

  end

  def feedback
    render 'layouts/feedback'
  end

end
