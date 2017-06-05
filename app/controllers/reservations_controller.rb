class ReservationsController < ApplicationController
  def clean
    current_reservation.clean!
    flash[:warning] = "All reservations cleared"
    redirect_to reservations_path
  end
end
