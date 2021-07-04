class PhotosController < ApplicationController

    def index
         image = Photo.all.with_attached_image

         render json: image.map { |image|
            image.as_json.merge({ image: url_for(image.image) })
         }
    end

    def photo_upload
        image = Photo.new(image_params)

        if image
            image.save
        else
            render json: {error: 'please send image'}
        end

        render json: {image: image}
    end

    def update
        photo = Photo.find(params[:id])

        if photo
            photo.update(image_params)
        else
            render json: {error: 'photo not found'}
        end
    end

    def update_album
        photos = Photo.all.select { |photo| photo.album_id == params[:album_id]}
        photos.map{|photo| photo.update(album_id: nil)}

        render json: {message: "Album is deleted"}
    end

    def remove_album
        photos = Photo.find(params[:id])
        if photos
            photos.update(album_id: nil)
        else
            render json: {error: 'photo not found'}
        end
        render json: {message: "remove from current album"}
    end

    def destroy
        photo = Photo.find(params[:id])
        if photo
            photo.destroy
        else
            render json: {error: 'photo not found'}
        end
        render json: {message: "photo is deleted"}
    end

    private

    def image_params
        params.permit(:name, :url, :album_id, :user_id, :image)
    end
end
