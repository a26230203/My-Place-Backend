class PhotosController < ApplicationController

    def index
         image = Photo.all.with_attached_image

         render json: image.map { |image|
            image.as_json.merge({ image: url_for(image.image) })
         }
    end


    def photo_upload

        image = Photo.create(image_params)

        render json: {image: image}
    end




    private

    def image_params
        params.permit(:name, :url, :album_id, :user_id, :image)
    end
end
