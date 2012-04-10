# Copyright (C) 2008-2012 AMEE UK Ltd. - http://www.amee.com
# Released as Open Source Software under the BSD 3-Clause license. See LICENSE.txt for details.

namespace :setup do

  # Performs application setup
  desc 'Sets up initial application data - only run once. Run as: rake "setup:data[<email>, <password>]"'
  task :data, [:email, :password] => [:environment] do |t, args|
    # Get commandline options
    user_opts = {
      :email => args[:email],
      :password => args[:password],
      :password_confirmation => args[:password],
      :admin => true
    }

    # Create user
    User.create(user_opts)
  end
end
