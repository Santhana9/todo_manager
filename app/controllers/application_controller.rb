class ApplicationController < ActionController::Base
    before_action :ensure_user_logged_in
    def ensure_user_logged_in
        unless current_user
            redirect_to "/"
        end
    end 
    
    def current_user
        return @current_user if @current_user #memoization the value the 
        # user stored only once during a session in which the action called multiple times
        # The instance variable is available only during a single request-response cycle once the request is processed the value is reset

        current_user_id = session[:current_user_id]
        if current_user_id
            @current_user = User.find(current_user_id)
        else
            nil
        end
    end
end
