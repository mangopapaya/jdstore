class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.total = current_reservation.total_price

    if @order.save
      current_reservation.reserved_programs.each do |reserved_program|
        program_list = ProgramList.new
        program_list.order = @order
        program_list.program_name = reserved_program.program.title
        program_list.program_category = reserved_program.program.category
        program_list.program_price = reserved_program.program.price
        program_list.slot = reserved_program.slot
        program_list.save
    end
      redirect_to order_path(@order.token)
    else
      render 'reservations/checkout'
    end
  end

  def show
    @order = Order.find_by_token(params[:id])
    @program_lists = @order.program_lists
  end

  def pay_with_alipay
    @order = Order.find_by_token(params[:id])
    @order.set_payment_with!("alipay")
    @order.pay!
    redirect_to order_path(@order.token), notice: "Successfully paid by Alipay"
  end

  def pay_with_wechat
    @order = Order.find_by_token(params[:id])
    @order.set_payment_with!("wechat")
    @order.pay!
    redirect_to order_path(@order.token), notice: "Successfully paid by Wechat Pay"
  end

  private

  def order_params
    params.require(:order).permit(:participant_name, :participant_age, :contact_name, :contact_number)
  end
end
