class ApplicationController < ActionController::Base
    helper_method :current_concierge

    def logged_in?
        redirect_to '/' if !current_concierge
    end

    def log_in(concierge)
        session[:concierge_id] = concierge.id
    end

    private

    def current_concierge
        @current_concierge ||= Concierge.find(session[:concierge_id]) if session[:concierge_id]
    end
end
