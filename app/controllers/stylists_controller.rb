class StylistsController < ApplicationController
    before_action :logged_in?

    def index
        @stylists = Stylist.all
        @appointments = Appointment.all
    end


    def show
        @stylist = Stylist.find(params[:id])
        @appointments = Appointment.all
    end

    def new
        @appointments = Appointment.all
        if current_concierge.admin == true
            @stylist = Stylist.new
        else
            flash[:error] = "You do not have permission to add a stylist"
            redirect_to appointments_path 
        end
    end

    def create
        @appointments = Appointment.all
        if current_concierge.admin == true
            @stylist = Stylist.create(stylist_params)

            if @stylist.save
                flash[:notice] = 'Stylist added'
                redirect_to stylist_appointments_path(@stylist)
            else
                render :new
            end
        end
    end

    def edit
        @appointments = Appointment.all
        if current_concierge.admin == true
            @stylist = Stylist.find_by(id: params[:id])
        else
            flash[:error] = "You do not have permission to edit a stylist"
            redirect_to appointments_path 
        end
    end

    def update
        if current_concierge.admin == true
            stylist = Stylist.find_by(id: params[:id])
            stylist.update(stylist_params)

            if stylist.save
                flash[:notice] = 'Information updated'
                redirect_to stylist_appointments_path(stylist)
            else
                flash[:error] = 'Information not updated.'
                redirect_to edit_stylist_path(stylist)
            end
        end
    end

    private

        def stylist_params
            params.require(:stylist).permit(:name)
        end

end
