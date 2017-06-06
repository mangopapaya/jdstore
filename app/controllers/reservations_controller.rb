class ReservationsController < ApplicationController
  def clean
    current_reservation.clean!
    flash[:warning] = "All reservations cleared"
    redirect_to reservations_path
  end

  def checkout
    @order = Order.new
  end
end
