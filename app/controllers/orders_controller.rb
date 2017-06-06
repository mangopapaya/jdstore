class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.total = current_reservation.total_price

    if @order.save
      redirect_to order_path(@order)
    else
      render 'reservations/checkout'
    end
  end

  private

  def order_params
    params.require(:order).permit(:participant_name, :participant_age, :contact_name, :contact_number)
  end
end
