class AlbumSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :photo_id
end
