# Copyright (C) 2008-2012 AMEE UK Ltd. - http://www.amee.com
# Released as Open Source Software under the BSD 3-Clause license. See LICENSE.txt for details.

Rails.application.routes.draw do
  resources :users, :controller => "AMEE::Auth::User"
  resource  :user_session, :controller => "AMEE::Auth::UserSessions", :only => [:new, :create, :destroy]
  resources :password_resets, :controller => "AMEE::Auth::PasswordResets"
  
  match 'logout' => 'AMEE::Auth::UserSessions#destroy', :as => "logout"
  match 'login' => 'AMEE::Auth::UserSessions#new',      :as => "login"
end