module SessionsHelper
  # Logs the user in.
  def log_in(user)
    session[:user_id] = user.id
  end
  
  # Returns the current logged-in user, if any.
  def current_user
    @current_user ||= User.find(session[:user_id]["$oid"]) if session[:user_id]
  end

  # Returns true if the user is logged in
  def logged_in?
    !current_user.nil?
  end

  # Returns true if current user is admin
  def is_admin?
    if !current_user.nil? && current_user.admin
      return true
    else
      false
    end
  end

  # Logs the user out.
  def log_out
    session[:user_id] = nil
  end
end
