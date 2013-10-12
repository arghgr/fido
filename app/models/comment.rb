class Comment < ActiveRecord::Base
  validates_presence_of :user_id, :post_id, :text
  belongs_to :user
  belongs_to :post
end
