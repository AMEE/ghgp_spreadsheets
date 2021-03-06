# Copyright (C) 2008-2012 AMEE UK Ltd. - http://www.amee.com
# Released as Open Source Software under the BSD 3-Clause license. See LICENSE.txt for details.

class UsersController < ApplicationController

  include ApplicationHelper
  before_filter :login_required
  before_filter :admin_login_required

  layout 'layouts/application'

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Account registered!"
    else
      flash[:notice] = "Could not create account"
    end
    redirect_to users_path
  end

  def show
    redirect_to summary_path
  end

  def index
    @users = User.find(:all)
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    if params[:id] == current_user.id || current_user.is_admin?
      puts params[:id] == current_user.id
      puts current_user.is_admin?
      @user = User.find(params[:id])
      if @user.update_attributes(params[:user])
        flash[:notice] = "Account updated!"
        redirect_to users_path
      else
        render :action => :edit
      end
    else
      redirect_to users_path
    end
  end

  def destroy
    if params[:id] == current_user.id || current_user.is_admin?
      User.find(params[:id]).delete
    end
    redirect_to users_path
  end

end