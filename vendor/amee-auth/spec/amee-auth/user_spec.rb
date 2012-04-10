# Copyright (C) 2008-2012 AMEE UK Ltd. - http://www.amee.com
# Released as Open Source Software under the BSD 3-Clause license. See LICENSE.txt for details.

require File.dirname(File.dirname(__FILE__)) + '/spec_helper.rb'
require File.dirname(File.dirname(__FILE__)) + '/../app/models/amee/auth/user.rb'

describe AMEE::Auth::User do
  
  it 'should be possible to create a user than inherits from the amee auth user' do
    class User < AMEE::Auth::User
    end
    @user = User.create(:email => "test@bob.com", :password => "test0123", :password_confirmation => "test0123")
    @user.id.should_not be_nil
  end
end