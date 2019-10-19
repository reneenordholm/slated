class ConciergesController < ApplicationController
    before_action :all_appointments, only: [:index, :show, :edit]
    before_action :logged_in?, except: [:new, :create]

    def index
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
        @concierge = Concierge.find(params[:id])
    end

    def edit
        set_concierge

        if admin?
            
        elsif !current_concierge_is_found_concierge?
            flash[:error] = "You do not have permission to update another concierge's account"
            redirect_to appointments_path 
        end
    end

    def update
        set_concierge
        if current_concierge_is_found_concierge? || admin?

            @concierge.update(concierge_params)

            if @concierge.save
                flash[:notice] = 'Information updated'
                redirect_to concierge_path(@concierge)
            else
                flash[:error] = 'Information not updated.'
                redirect_to edit_concierge_path(@concierge)
            end
        end
    end

    def destroy 
        set_concierge
        admin?
        @concierge.destroy 
        flash[:notice] = 'Concierge deleted.'
        redirect_to concierges_path
    end
    
    private

    def concierge_params
        params.require(:concierge).permit(:password, :email, :name, :admin)
    end

    def set_concierge
        @concierge = Concierge.find_by(id: params[:id])
    end

    def current_concierge_is_found_concierge?
        current_concierge == @concierge
    end


end
