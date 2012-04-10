# Copyright (C) 2008-2012 AMEE UK Ltd. - http://www.amee.com
# Released as Open Source Software under the BSD 3-Clause license. See LICENSE.txt for details.

class User < AMEE::Auth::User

  def is_admin?
    admin
  end
  
end
