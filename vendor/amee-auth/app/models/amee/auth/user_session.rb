# Copyright (C) 2008-2012 AMEE UK Ltd. - http://www.amee.com
# Released as Open Source Software under the BSD 3-Clause license. See LICENSE.txt for details.

class AMEE::Auth::UserSession < Authlogic::Session::Base
  logout_on_timeout true
  consecutive_failed_logins_limit 3
  
  # Return the rails User object
  def base_user
    ::User.find(user.id) if user
  end
end