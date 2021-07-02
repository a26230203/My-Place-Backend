class JouranlImagesController < ApplicationController

    def upload
        # image = JouranlImage.new(image_params)
        # byebug
        # render json:(images: image)
    end


    private

    def image_params
        params.permit(:journal_id, :journal_draft_id, :imageUrl)
    end
end
