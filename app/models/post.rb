class Post < ActiveRecord::Base
  validates_presence_of :published_at, :user_id
  belongs_to :user
end