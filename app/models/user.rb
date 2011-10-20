

class User < AMEE::Auth::User

  def is_admin?
    admin
  end
  
end
