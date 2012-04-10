# Copyright (C) 2008-2012 AMEE UK Ltd. - http://www.amee.com
# Released as Open Source Software under the BSD 3-Clause license. See LICENSE.txt for details.

module AMEE
  module Auth
    module Controller
      extend ActiveSupport::Concern

      included do
        helper_method :current_user_session, :current_user, :logged_in?
      end
      
      module InstanceMethods
        def current_user_session
          return @current_user_session if defined?(@current_user_session)
          @current_user_session = AMEE::Auth::UserSession.find
        end

        def current_user
          return @current_user if defined?(@current_user)
          @current_user = current_user_session && current_user_session.base_user
        end

        def logged_in?
          current_user
        end

        def login_required
          unless current_user
            store_location
            flash[:notice] = "You must be logged in to access this page"
            respond_to do |format|
              format.html {redirect_to new_user_session_path}
              format.js {render(:update) {|page| page.redirect_to new_user_session_path}}
            end
            return false
          end
        end

        def store_location
          session[:return_to] = request.request_uri
        end

        def redirect_back_or_default(default)
          redirect_to(session[:return_to] || default)
          session[:return_to] = nil
        end
      end
    end
  end
end

::ActionController::Base.send :include, AMEE::Auth::Controller