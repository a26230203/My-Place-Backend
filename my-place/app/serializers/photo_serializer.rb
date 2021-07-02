class PhotoSerializer < ActiveModel::Serializer
  attributes :id, :name, :user_id, :image

  has_one_attached :image
end
