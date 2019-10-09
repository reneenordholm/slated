class ApplicationController < ActionController::Base

    def logged_in?
        redirect_to '/' if !current_concierge
    end

    private

    def current_concierge
        @current_concierge ||= Concierge.find(session[:concierge_id]) if session[:concierge_id]
    end
end
