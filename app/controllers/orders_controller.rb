class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :destroy, :conclusion]

  def create
    @order = Order.create(shop_id: params[:shop_id])
    redirect_to order_path(@order.hashid)
  end

  def show
    @entries = @order.entries.includes(:drink)
    @shop = @order.shop
  end

  def destroy
    @order.destroy
    redirect_to root_path
  end

  def conclusion
    render plain: @order.conclusion
  end

  private

  def set_order
    @order = Order.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

end
