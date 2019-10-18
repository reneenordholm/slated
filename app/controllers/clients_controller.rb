class ClientsController < ApplicationController
    before_action :logged_in?

    def index 
        @clients = Client.all
        @appointments = Appointment.all
    end
    
    def show
        @client = Client.find(params[:id])
        @appointments = Appointment.all
    end

    def new
        @client = Client.new
        @appointments = Appointment.all
        @stylist = Stylist.find_by(id: params[:stylist_id])
    end

    def create
        @appointments = Appointment.all
        @client = Client.create(client_params)

        if @client.save
            flash[:notice] = 'Client created successfully.' 
            redirect_to new_client_appointment_path(@client)
        else
            render :new
        end
    end

    def edit
        @client = Client.find_by(id: params[:id])
        @appointments = Appointment.all
    end

    def update
        client = Client.find_by(id: params[:id])
        client.update(client_params)

        if client.save
            flash[:notice] = 'Information updated'
            redirect_to client_path(client)
        else
            flash[:error] = 'Information not updated.'
            redirect_to edit_client_path(client)
        end
    end

    private

        def client_params
            params.require(:client).permit(:name, :email, :phone, :stylist_id)
        end

end
