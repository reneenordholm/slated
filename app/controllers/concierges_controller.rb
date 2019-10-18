class ConciergesController < ApplicationController
    helper_method :is_admin?
    before_action :all_appointments, only: [:index, :show, :edit]

    def index
        logged_in?
        @concierges = Concierge.all
    end

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
        logged_in?
        @concierge = Concierge.find(params[:id])
    end

    def edit
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

    def destroy 
        @concierge = Concierge.find_by(id: params[:id])
        @concierge.destroy 
        flash[:notice] = 'Concierge deleted.'
        redirect_to concierges_path
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
