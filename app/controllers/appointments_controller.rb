class AppointmentsController < ApplicationController
    before_action :logged_in?

    def index
        if params[:stylist_id]
            @stylist = Stylist.find(params[:stylist_id])
            @appointments = @stylist.appointments
        elsif params[:client_id]
            @client = Client.find(params[:client_id])
            @appointments = @client.appointments
        else
            @appointments = Appointment.all
        end
    end

    def show
        @appointment = Appointment.find_by_id(params[:id])
        @appointments = Appointment.all
        if @appointment.nil?
            flash[:notice] = 'That appointment does not exist' 
            redirect_to appointments_path 
        end
    end

    def new
        @stylist = Stylist.find_by(id: params[:stylist_id])
        @client = Client.find_by(id: params[:client_id])
        @appointments = current_concierge.appointments.select { |a| a.persisted? }
        @appointment = current_concierge.appointments.build
    end

    def create
        appointment = Appointment.new(appointment_params.merge(concierge_id: current_concierge.id))
        
        if appointment.valid?
          appointment.save
          redirect_to appointments_path
        else 
          appointment.concierge = nil
          appointments = current_concierge.appointments.select { |a| a.persisted? }
          render :new
        end
    end

    def edit
        @appointment = Appointment.find_by(id: params[:id])
        @appointments = Appointment.all
    end

    def update
        appointment = Appointment.find_by(id: params[:id])
        appointment.update(appointment_params)

        if appointment.save
            redirect_to appointment_path(appointment)
        else
            redirect_to edit_appointment_path(appointment)
        end
    end

    def destroy 
        @appointment = Appointment.find_by(id: params[:id])
        @appointment.destroy 
        redirect_to appointments_path
    end

    private

    def appointment_params
        params.require(:appointment).permit(:start_time, :end_time, :service_id, :concierge_id, :stylist_id, :client_id)
    end


end
