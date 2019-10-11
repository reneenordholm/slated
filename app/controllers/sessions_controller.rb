class SessionsController < ApplicationController
    def new
    end

    def create
        @concierge = Concierge.find_by(username: params[:username])
   
        if !@concierge.nil? && @concierge.authenticate(params[:password])
            session[:concierge_id] = @concierge.id
            redirect_to appointments_path
        else
            redirect_to login_path
        end
    end

    def google_auth
        # Get access tokens from the google server
        access_token = request.env["omniauth.auth"]
        concierge = Concierge.from_omniauth(access_token)
      
        log_in(concierge)
        # Access_token is used to authenticate request made from the rails application to the google server
        concierge.google_token = access_token.credentials.token
        # Refresh_token to request new access_token
        # Note: Refresh_token is only sent once during the first request
        refresh_token = access_token.credentials.refresh_token
        concierge.google_refresh_token = refresh_token if refresh_token.present?
        concierge.save
      
        flash[:success] = 'You are logged in'
      
        redirect_to root_path
    end
    
    def destroy
        session.clear
        redirect_to root_path
    end

    private

        def auth
            request.env['omniauth.auth']
        end
end
