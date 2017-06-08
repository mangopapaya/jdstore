module OrdersHelper

  def render_order_status(order)
    if order.order_placed?
      "Order Placed"
    elsif order.paid?
      "Paid"
    elsif order.upcoming?
      "Charged"
    elsif order.completed?
      "Program Completed"
    else
      "Reservation Cancelled"
    end
  end

end
