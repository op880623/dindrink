class OrdersController < ApplicationController

  def index
    @shops = Shop.all
  end

  def create
    @order = Order.create(shop_id: params[:shop_id])
    redirect_to order_path(@order.hashid)
  end

  def show
    @order = Order.find(params[:hash_id])
    @shop = Shop.find(@order.shop_id)
    @entries = @order.entries
  end

  def destroy
    @order = Order.find(params[:hash_id])
  end

end
