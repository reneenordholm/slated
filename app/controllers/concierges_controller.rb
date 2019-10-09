class ConciergesController < ApplicationController

    def new
        @concierge = Concierge.new
    end

    def create
        @concierge = Concierge.create(concierge_params)
        session[:concierge_id] = @concierge.id

        redirect_to appointments_path
    end
    
    private

    def concierge_params
        params.require(:concierge).permit(:username, :password, :email, :name, :admin)
    end
end
