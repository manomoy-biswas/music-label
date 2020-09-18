module SessionsHelper
  def login(user)
    cookies[:auth_token] = user.auth_token
  end

  def login_with_remember_me(user)
    cookies.parmanent[:auth_token] = user.auth_token
  end

  def logout
    cookies.delete
  end
end
