class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising and exception
  # For APIs, you may want to use :null_sessioin instead.

  protect_from_forgery with: :exception

  def admin_required
    if !current_user.admin?
      redirect_to "/", alert: "You are not admin."
    end
  end
  
end
