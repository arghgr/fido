class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :user_id, :published_at, :intro, :extended
  has_many :comments
  embed :ids, include: true
end