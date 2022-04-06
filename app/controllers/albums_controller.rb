class AlbumsController < ApplicationController
    def new
        @band_id = params[:band_id]
        render :new
    end
    
    def create

        @album = Album.new(album_params)
        if @album.save
            redirect_to album_url(@album)
        else
            flash.now[:errors] = @album.errors.full_messages
            render :new
        end
        
    end

    
    def show 
        @album = Album.find_by(id:params[:id])
        if @album
            render :show
        else
            redirect_to new_session_url
        end
    end
    private    
    def album_params
        params.require(:album).permit(:title, :year, :live,:band_id)
    end
end
