class BandsController < ApplicationController
    def index
        @bands = Band.all
        render :index
    end

    def create
        @band = Band.new(name: params[:band][:name])
        if @band.save
            redirect_to bands_url
        else
            render :new
        end
    end

    def new
        render :new
    end

    def edit
    end
    
    def show
    end

    def update
    end

    def destroy
    end
end