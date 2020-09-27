class ApplicationController < ActionController::Base

    # visible to views
    helper_method :current_user, :logged_in?

    private

    def current_user
        @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!session[:user_id]
    end

    def redirect_if_not_logged_in # Should I expand and add a flash message?
        if !logged_in?
            flash[:error] = "You must be logged to view that page."
            redirect_to login_path 
        end
    end

end
