# Copyright (C) 2008-2012 AMEE UK Ltd. - http://www.amee.com
# Released as Open Source Software under the BSD 3-Clause license. See LICENSE.txt for details.

module AMEE
  module Auth
    class PasswordResetsController < ApplicationController
      before_filter :load_using_perishable_token, :only => [:edit, :update]

      def new
        render
      end

      def create
        @user = ::User.find_by_email(params[:email])
        if @user
          @user.deliver_password_reset_instructions!
          flash[:notice] = "Instructions to reset your password have been emailed to you. Please check your email."
          redirect_to new_user_session_path
        else
          flash.now[:error] = "No user was found with that email address"
          render :action => :new
        end
      end

      def edit
        render
      end

      def update
        @user.password = params[:user][:password]
        @user.password_confirmation = params[:user][:password_confirmation]
        if @user.save
          flash[:notice] = "Password successfully updated"
          redirect_to root_path
        else
          render :action => :edit
        end
      end

      private
      def load_using_perishable_token
        @user = ::User.find_using_perishable_token(params[:id])
        unless @user
          flash[:error] = "We're sorry, but we could not locate your account"
          redirect_to new_user_session_path  
        end
      end
    end
  end
end