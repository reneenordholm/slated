class AppointmentsController < ApplicationController
    before_action :logged_in?
    before_action :all_appointments, only: [:show, :edit]

    def index
        if params[:stylist_id]
            @stylist = Stylist.find(params[:stylist_id])
            @appointments = @stylist.appointments
        elsif params[:client_id]
            @client = Client.find(params[:client_id])
            @appointments = @client.appointments
        else
            @appointments = Appointment.all
            @appointment = current_concierge.appointments.build
        end
    end

    def show
        @appointment = Appointment.find_by_id(params[:id])
        if @appointment.nil?
            flash[:notice] = 'That appointment does not exist' 
            redirect_to appointments_path 
        end
    end

    def new
        if params[:stylist_id]
            @stylist = Stylist.find(params[:stylist_id])
            @appointments = @stylist.appointments
            @appointment = current_concierge.appointments.build
        elsif params[:client_id]
            @client = Client.find(params[:client_id])
            @appointments = @client.appointments
            @appointment = current_concierge.appointments.build
        else
            @appointments = Appointment.all
            @appointment = current_concierge.appointments.build
        end
    end

    def create
        @appointment = Appointment.new(appointment_params.merge(concierge_id: current_concierge.id))
        
        if @appointment.save
            flash[:notice] = 'Appointment created.'
            redirect_to appointment_path(@appointment)
        else
            # @appointment.concierge = nil
            @appointments = current_concierge.appointments.select { |a| a.persisted? }
            flash[:notice] = 'Appointment cannot be created.'
            render :new
        end
    end

    def edit
        @appointment = Appointment.find_by(id: params[:id])
    end

    def update
        appointment = Appointment.find_by(id: params[:id])
        appointment.update(appointment_params)

        if appointment.save
            flash[:notice] = 'Appointment updated.'
            redirect_to appointment_path(appointment)
        else
            flash[:notice] = 'Appointment cannot be updated.'
            redirect_to edit_appointment_path(appointment)
        end
    end

    def destroy 
        @appointment = Appointment.find_by(id: params[:id])
        @appointment.destroy 
        flash[:notice] = 'Appointment deleted.'
        redirect_to appointments_path
    end

    private

    def appointment_params
        params.require(:appointment).permit(:start_time, :end_time, :service_id, :concierge_id, :stylist_id, :client_id)
    end


end
