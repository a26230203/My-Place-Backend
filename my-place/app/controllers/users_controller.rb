class UsersController < ApplicationController

    def index 
        users = User.all.with_attached_img
        render json: users.map { |user|
            user.as_json.merge({ img: url_for(user.img) })
        }
    end


    def create
        user = User.new(user_params)

        if user.valid?
            user.save
            render json: {user: UserSerializer.new(user), token: encode_token({ user_id: user.id })}
        else
            render json: {error: "Pleaes try again"}
        end
    end

    def login
        user = User.find_by(username: params[:username].strip)
        if user && user.authenticate(params[:password].strip)

            render json: {user: UserSerializer.new(user), token: encode_token({ user_id: user.id })}
        else
            render json: {error: "Esername or Password is not correct"}
        end
    end

    def update
        user = User.find(params[:id])

        if user 
            user.update(user_params)
        else
            render json: {error: 'user not found'}
        end
    end

    private

    def user_params
        params.permit(:username, :password, :name, :image, :address, :post_code, :email, :phone, :img)
    end
end
