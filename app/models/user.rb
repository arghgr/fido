class User < ActiveRecord::Base

  def check_password(input_password)
    input_password == password
  end
end
