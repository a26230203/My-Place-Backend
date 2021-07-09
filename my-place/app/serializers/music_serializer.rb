class MusicSerializer < ActiveModel::Serializer
  attributes :id, :title, :info, :resource, :time, :img
end
