class WelcomeController < ApplicationController
    def home
    end

    def most_booked
        @most_booked = Stylist.most_booked
    end
end
