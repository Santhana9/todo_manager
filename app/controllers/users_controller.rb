class UsersController < ApplicationController
    skip_before_action :ensure_user_logged_in
    skip_before_action :verify_authenticity_token
    def new
        render "users/new"
    end

    def index
        #render plain: "In USers controllers"
        render plain: User.all.map{|user| user.to_pleasant_string}.join("\n")
    end
    def create
        # byebug
        first_name = params[:first_name]
        last_name = params[:last_name]
        email = params[:email]
        password = params[:password]
        new_user = User.create!(
            first_name: first_name,
            last_name: last_name,
            email: email,
            password: password,
        )
        #session[current_user_id] = new_user.id
        redirect_to root_path
    end

    def login
        email = params[:email]
        password = params[:password]
        user = User.where("email = ? and password = ?", email, password)
        render plain: "#{not user.empty?}"
    end
end