class MusicsController < ApplicationController

    
    def index
        music = Music.all.with_attached_music
        render json: music.map { |music|
            music.as_json.merge({ music: url_for(music.music) })
        }
    end

    def preview
        # audio file preview
    end
    
    def create

        music = Music.new(music_pramas)

        if music 
            music.save
        else
            render json: {error: 'please send audio file'}
        end

    end

    def destroy
        music = Music.find(params[:id])
        if music
            music.destroy
        else
            render json: {error: 'music not found'}
        end
        render json: {message: "music is deleted"}
    end 


    private 
    
    def music_pramas
        params.permit(:user_id, :title, :description, :author, :img, :music)
    end

end
