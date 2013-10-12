class User < ActiveRecord::Base

  has_many :posts
  has_many :comments

  def check_password(input_password)
    input_password == password
  end
end