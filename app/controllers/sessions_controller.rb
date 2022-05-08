class SessionsController < ApplicationController
    skip_before_action :ensure_user_logged_in
    skip_before_action :verify_authenticity_token
    def new
    end

    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:current_user_id] = user.id
            redirect_to "/"
        else
            flash[:error] = "Your login attempt failed. Please check your Credentials"
            redirect_to new_sessions_path
        end
    end

    def destroy
        #render plain: "Inside destroy"
        session[:current_user_id] = nil
        @current_user = nil
        redirect_to "/"
    end
end