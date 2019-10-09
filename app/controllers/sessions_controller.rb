class SessionsController < ApplicationController
    def new
    end

    def create
        @concierge = Concierge.find_by(username: params[:concierge][:username])
   
        if  @concierge.authenticate(params[:concierge][:password])
            session[:concierge_id] = @concierge.id
            redirect_to root_path
        else
            binding.pry
            redirect_to login_path
        end
    end
end
