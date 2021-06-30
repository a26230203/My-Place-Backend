class UsersController < ApplicationController

    def index 
        user = User.all

        render jason: user
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
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            render json: {user: UserSerializer.new(user), token: encode_token({ user_id: user.id })}
        else
            render json: {error: "Esername or Password is not correct"}
        end
    end

    private

    def user_params
        params.permit(:username, :password, :name, :image, :address, :post_code, :email, :phone)
    end
end
