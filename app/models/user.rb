

class User < AMEE::Authentication::User

  def is_admin?
    admin
  end
  
end
