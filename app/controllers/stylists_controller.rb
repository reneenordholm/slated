class StylistsController < ApplicationController

    def show
        @stylist = Stylist.find(params[:id])
    end

end
