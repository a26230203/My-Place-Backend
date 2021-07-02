class JournalSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :title, :content, :created_at


end
