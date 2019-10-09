class ConciergesController < ApplicationController

    def new
        @concierge = Concierge.new
    end

    def create
        @concierge = Concierge.create(concierge_params)

        if @concierge.save == true
            session[:concierge_id] = @concierge.id
        
            redirect_to appointments_path
        else
            redirect_to signin_path
        end
    end
    
    private

    def concierge_params
        params.require(:concierge).permit(:username, :password, :email, :name, :admin)
    end
end
