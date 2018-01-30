class OrdersController < ApplicationController

  def new
  end

  def create
    @order = Order.create()
    redirect_to order_path(@order.hashid)
  end

  def show
    @order = Order.find(params[:hashid])
  end

  def update
  end

end
