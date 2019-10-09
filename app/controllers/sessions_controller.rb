class SessionsController < ApplicationController
    def new
        logged_in?
    end

    def create
        @concierge = Concierge.find_by(username: params[:username])
   
        if !@concierge.nil? && @concierge.authenticate(params[:password])
            session[:concierge_id] = @concierge.id
            redirect_to root_path
        else
            redirect_to login_path
        end
    end
end
