# Copyright (C) 2008-2012 AMEE UK Ltd. - http://www.amee.com
# Released as Open Source Software under the BSD 3-Clause license. See LICENSE.txt for details.

module AMEE
  module Auth
    class UserSessionsController < ApplicationController
      def new
        current_user_session.try(:destroy)
        @user_session = UserSession.new
      end

      def create
        @user_session = UserSession.new(params[:amee_auth_user_session])
    
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
        redirect_to new_user_session_path
      end
    end
  end
end