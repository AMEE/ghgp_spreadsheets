# Copyright (C) 2008-2012 AMEE UK Ltd. - http://www.amee.com
# Released as Open Source Software under the BSD 3-Clause license. See LICENSE.txt for details.

class ApplicationController < ActionController::Base
  
  protect_from_forgery
  
  include ApplicationHelper
  helper_method :current_user_session, :current_user, :logged_in?, :admin_login_required
  before_filter :is_demo_instance?
  
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

  def is_demo_instance?
    @demo = request.host =~ /(-demo|localhost)/ ? true : false
  end

end
