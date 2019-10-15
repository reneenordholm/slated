class ServicesController < ApplicationController

    def index
        @services = Service.all
    end
    
    def show
        @service = Service.find(params[:id])
    end

    def new
        if current_concierge.admin == true
            @service = Service.new
        else
            flash[:error] = "You do not have permission to add a service"
            redirect_to appointments_path 
        end
    end

    def create
        if current_concierge.admin == true
            @service = Service.create(service_params)

            if @service.save
                flash[:notice] = 'Service added'
                redirect_to service_path(@service)
            else
                render :new
            end
        end
    end

    def edit
        if current_concierge.admin == true
            @service = Service.find_by(id: params[:id])
        else
            flash[:error] = "You do not have permission to edit a service"
            redirect_to appointments_path 
        end
    end

    def update
        if current_concierge.admin == true
            service = Service.find_by(id: params[:id])
            service.update(service_params)

            if service.save
                flash[:notice] = 'Information updated'
                redirect_to service_path(service)
            else
                flash[:error] = 'Information not updated.'
                redirect_to edit_service_path(service)
            end
        end
    end

    private

        def service_params
            params.require(:service).permit(:name, :description, :duration)
        end

end
