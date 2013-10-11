class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :user_id, :published_at, :intro, :extended
end