class StylistsController < ApplicationController
    before_action :logged_in?
    before_action :all_appointments, except: [:update]

    def index
        @stylists = Stylist.all
    end


    def show
        @stylist = Stylist.find(params[:id])
    end

    def new
        if admin?
            @stylist = Stylist.new
        else
            flash[:error] = "You do not have permission to add a stylist"
            redirect_to appointments_path 
        end
    end

    def create
        if admin?
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
        if admin?
            set_stylist
        else
            flash[:error] = "You do not have permission to edit a stylist"
            redirect_to appointments_path 
        end
    end

    def update
        if admin?
            set_stylist
            @stylist.update(stylist_params)

            if @stylist.save
                flash[:notice] = 'Information updated'
                redirect_to stylist_appointments_path(@stylist)
            else
                flash[:error] = 'Information not updated.'
                redirect_to edit_stylist_path(stylist)
            end
        end
    end

    def destroy 
        set_stylist
        @stylist.destroy 
        flash[:notice] = 'Stylist deleted.'
        redirect_to stylists_path
    end

    private

        def stylist_params
            params.require(:stylist).permit(:name)
        end

        def set_stylist
            @stylist = Stylist.find_by(id: params[:id])
        end

end
