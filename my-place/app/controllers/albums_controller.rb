class AlbumsController < ApplicationController

    def index
        album = Album.all

        render json:  album
    end

    def create
        album = Album.new(album_params)

        if album
            album.save
        else
            render json: {error: 'please upload album'}
        end
    end

    def destroy
        album = Album.find(params[:id])
        if album
            album.destroy
        else
            render json: {error: 'Album not found'}
        end
        render json: {message: "album is deleted"}
    end

    private

    def album_params
        params.permit(:name, :user_id)
    end
end
