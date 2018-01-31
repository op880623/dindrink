class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :destroy]

  def create
    @order = Order.create(shop_id: params[:shop_id])
    redirect_to order_path(@order.hashid)
  end

  def show
    @entries = @order.entries.includes(:drink)
    @shop = Shop.find(@order.shop_id)
  end

  def destroy
    @order.destroy
    redirect_to root_path
  end

  private

  def set_order
    @order = Order.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

end
