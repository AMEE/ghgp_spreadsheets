# Copyright (C) 2008-2012 AMEE UK Ltd. - http://www.amee.com
# Released as Open Source Software under the BSD 3-Clause license. See LICENSE.txt for details.

class AMEE::Auth::User < ActiveRecord::Base

  self.abstract_class = true
  acts_as_authentic do |c|
    c.logged_in_timeout = 1.hours
    # If for an existing application use the following (also alter migration so User columns crypted_password and salt are no longer limited to 40 characters):
    # c.transition_from_restful_authentication = true
  end

  attr_protected  :crypted_password, :password_salt, :persistence_token, :perishable_token,
                  :login_count, :failed_login_count, :last_request_at, :current_login_at,
                  :last_login_at, :current_login_ip, :last_login_ip
              
  def deliver_password_reset_instructions!
    reset_perishable_token!
    UserMailer.reset_password(self).deliver
  end
end