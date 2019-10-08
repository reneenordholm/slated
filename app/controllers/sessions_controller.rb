class SessionsController < ApplicationController
    def new
    end

    def create
        @concierge = Concierge.find_by(username: params[:concierge][:username])

        if !@concierge.nil? && @concierge.authenticate(params[:user][:password])
            session[:concierge_id] = @concierge.id
            redirect_to root_path
        else
            redirect_to login_path
        end
    end
end
