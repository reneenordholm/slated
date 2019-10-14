class ConciergesController < ApplicationController

    def new
        @concierge = Concierge.new
    end

    def create
        @concierge = Concierge.create(concierge_params)

        if @concierge.save
            log_in(@concierge)
            redirect_to appointments_path
        else
            render :new
        end
    end

    def show
        @concierge = Concierge.find(params[:id])
    end
    
    private

    def concierge_params
        params.require(:concierge).permit(:password, :email, :name, :admin)
    end

end
