class SessionsController < ApplicationController

    before_action :require_logged_in, only:[:destroy]
    before_action :require_logged_out, only:[:new, :create]

    def new
       render :new
    end

    def create
        @user = User.find_by_credentials(params[:user][:email],params[:user][:password])
        if @user
            login(@user)
            redirect_to user_url(@user)
        else
            flash.now[:errors] = ["No User Found with the credentials."]
            render :new
        end
    end

    def destroy
        logout!
        render :new
    end
end
