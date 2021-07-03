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


    def destroy
        photo = Photo.find(params[:id])
        photo.destroy
        render json: {message: "photo is deleted"}
    end




    private

    def image_params
        params.permit(:name, :url, :album_id, :user_id, :image)
    end
end
