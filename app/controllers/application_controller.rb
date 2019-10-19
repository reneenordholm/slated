class ApplicationController < ActionController::Base
    helper_method :current_concierge, :admin?


    def logged_in?
        log_in_error if !current_concierge
    end

    def log_in_error
        flash[:error] = 'Please log in for full access to website.'
        redirect_to root_path
    end

    def log_in(concierge)
        session[:concierge_id] = concierge.id
    end

    private

    def current_concierge
        #@current_concierge ||=
         Concierge.find(session[:concierge_id]) if session[:concierge_id]
    end

    def all_appointments
        @appointments = Appointment.all
    end

    def admin?
        current_concierge.admin == true
    end



end
