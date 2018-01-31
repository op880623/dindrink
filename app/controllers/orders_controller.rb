class OrdersController < ApplicationController

  def create
    @order = Order.create(shop_id: params[:shop_id])
    redirect_to order_path(@order.hashid)
  end

  def show
    @order = Order.find(params[:id])
    @entries = @order.entries.includes(:drink)
    @shop = Shop.find(@order.shop_id)
  end

  def destroy
    @order = Order.find(params[:id])
  end

end
