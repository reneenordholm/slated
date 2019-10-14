class SessionsController < ApplicationController
    def new
    end

    def create
        @concierge = Concierge.find_by(email: params[:email])
   
        if !@concierge.nil? && @concierge.authenticate(params[:password])
            log_in(@concierge)
            flash[:notice] = 'You are logged in'
            redirect_to appointments_path
        else
            flash[:error] = 'Your username/password combo is incorrect.'
            redirect_to signin_path
        end
    end

    def google_auth
        # Get access tokens from the google server
        access_token = request.env["omniauth.auth"]
        concierge = Concierge.from_omniauth(access_token)
      
        
        # Access_token is used to authenticate request made from the rails application to the google server
        concierge.google_token = access_token.credentials.token
        # Refresh_token to request new access_token
        # Note: Refresh_token is only sent once during the first request
        refresh_token = access_token.credentials.refresh_token
        concierge.google_refresh_token = refresh_token if refresh_token.present?
        concierge.save
        log_in(concierge)
        flash[:notice] = 'You are logged in'
      
        redirect_to appointments_path
    end
    
    def destroy
        session.clear
        flash[:notice] = "You have successfully logged out"
        redirect_to root_path
    end

    private

        def auth
            request.env['omniauth.auth']
        end
end
