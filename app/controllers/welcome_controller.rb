class WelcomeController < ApplicationController
    def home
    end

    def most_booked
        logged_in?
        @most_booked = Stylist.most_booked
    end

end
