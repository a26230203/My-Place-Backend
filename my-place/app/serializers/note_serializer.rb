class NoteSerializer < ActiveModel::Serializer
  attributes :id, :text, :color, :x, :y
end
