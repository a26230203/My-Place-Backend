class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password_digest, :name, :image, :address, :email, :phone, :post_code
end
