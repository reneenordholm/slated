class SessionsController < ApplicationController
    def new

    end

    def create
        @concierge = Concierge.find_by(username: params[:username])
   
        if !@concierge.nil? && @concierge.authenticate(params[:password])
            session[:concierge_id] = @concierge.id
            redirect_to appointments_path
        else
            redirect_to login_path
        end
    end

    
    def destroy
        session.clear
        redirect_to root_path
    end
end
