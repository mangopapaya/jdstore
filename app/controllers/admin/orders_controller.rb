class Admin::OrdersController < ApplicationController
  layout "admin"

  before_action :authenticate_user!
  before_action :admin_required

  def index
    @orders = Order.order("id DESC")
  end

  def show
    @order = Order.find(params[:id])
    @program_lists = @order.program_lists
  end

  def cancel
    @order = Order.find(params[:id])
    @order.cancel_reservation!
    redirect_to :back
  end

  def charge
    @order = Order.find(params[:id])
    @order.charge_order!
    redirect_to :back
  end

  def deliver
    @order = Order.find(params[:id])
    @order.deliver!
    redirect_to :back
  end

  def refund
    @order = Order.find(params[:id])
    @order.refund_order!
    redirect_to :back
  end

end
