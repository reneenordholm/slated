class ConciergesController < ApplicationController
    helper_method :is_admin?

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
        @appointments = Appointment.all
    end

    def edit
        @appointments = Appointment.all
        @concierge = Concierge.find_by(id: params[:id])

        if current_concierge.admin == true
            
        elsif current_concierge != @concierge
            flash[:error] = "You do not have permission to update another concierge's account"
            redirect_to appointments_path 
        end
    end

    def update
        concierge = Concierge.find_by(id: params[:id])
        if current_concierge != @concierge || current_concierge.admin == true

            concierge.update(concierge_params)

            if concierge.save
                flash[:notice] = 'Information updated'
                redirect_to concierge_path(concierge)
            else
                flash[:error] = 'Information not updated.'
                redirect_to edit_concierge_path(concierge)
            end
        end
    end
    
    private

    def concierge_params
        params.require(:concierge).permit(:password, :email, :name, :admin)
    end

    def is_admin?
        @concierge = Concierge.find_by(id: params[:id])
        if @concierge.admin == true
          "Yes"
        else
          "No"
        end
    end

end
