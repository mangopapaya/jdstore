class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising and exception
  # For APIs, you may want to use :null_sessioin instead.

  protect_from_forgery with: :exception

  def admin_required
    if !current_user.admin?
      redirect_to "/", alert: "You are not admin."
    end
  end

  helper_method :current_reservation

  def current_reservation
    @current_reservation ||= find_reservation
  end

  private

  def find_reservation
    reservation = Reservation.find_by(id: session[:reservation_id])
    if reservation.blank?
      reservation = Reservation.create
    end
    session["reservation_id"] = reservation.id
    return reservation
  end
end
