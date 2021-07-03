class AlbumsController < ApplicationController

    def index
        album = Album.all

        render json: {album: album}
    end

    def create
        album = Album.new(album_params)

        if album
            album.save
        else
            render json: {error: 'please upload album'}
        end
    end

    private

    def album_params
        params.permit(:name, :user_id)
    end
end
