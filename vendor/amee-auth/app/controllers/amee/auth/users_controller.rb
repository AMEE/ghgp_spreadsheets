# Copyright (C) 2008-2012 AMEE UK Ltd. - http://www.amee.com
# Released as Open Source Software under the BSD 3-Clause license. See LICENSE.txt for details.

module AMEE
  module Auth
    class UsersController < ApplicationController
      before_filter :login_required, :only => [:show, :edit, :update]
  
      def new
        @user = AMEE::Auth::User.new
      end
  
      def create
        @user = AMEE::Auth::User.new(params[:user])
        if @user.save_without_session_maintenance
          flash[:notice] = "Account created!"
          redirect_to new_user_path
        else
          render :action => :new
        end
      end
  
      def show
        @user = current_user
      end

      def edit
        @user = current_user
      end
  
      def update
        @user = current_user
        if @user.update_attributes(params[:user])
          flash[:notice] = "Account updated!"
          redirect_to edit_user_path(@user)
        else
          render :action => :edit
        end
      end
    end
  end
end