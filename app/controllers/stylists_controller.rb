class StylistsController < ApplicationController

    def index
        @stylists = Stylist.all
    end


    def show
        @stylist = Stylist.find(params[:id])
    end

    def new
        
    end

end
