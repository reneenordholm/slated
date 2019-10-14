class ConciergesController < ApplicationController
    helper_method :admin_view

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
        @concierge = Concierge.find_by(id: params[:id])
    end

    def update
        concierge = Concierge.find_by(id: params[:id])
        concierge.update(concierge_params)

        if concierge.save
            flash[:notice] = 'Information updated'
            redirect_to concierge_path(concierge)
        else
            flash[:error] = 'Information not updated.'
            redirect_to edit_concierge_path(concierge)
        end
    end
    
    private

    def concierge_params
        params.require(:concierge).permit(:password, :email, :name, :admin)
    end

    def admin_view
        concierge = Concierge.find_by(id: params[:id])
        if concierge.admin == true
          "Yes"
        else
          "No"
        end
    end

end
