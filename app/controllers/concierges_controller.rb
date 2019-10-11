class ConciergesController < ApplicationController

    def new
        @concierge = Concierge.new
    end

    def create
        @concierge = Concierge.create(concierge_params)

        if @concierge.save == true
            log_in(@concierge)
            redirect_to appointments_path
        else
            redirect_to signup_path
        end
    end

    def show
        @concierge = Concierge.find(params[:id])
    end
    
    private

    def concierge_params
        params.require(:concierge).permit(:username, :password, :email, :name, :admin)
    end

end
