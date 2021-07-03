class AlbumSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :name, :photos

  has_many :photos
end
