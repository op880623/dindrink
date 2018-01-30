class OrdersController < ApplicationController
  require 'JSON'

  def index
    @shops = Shop.all
  end

  def create
    @order = Order.create(content: {shop: params[:shopid]}.to_json)
    redirect_to order_path(@order.hashid)
  end

  def show
    @order = Order.find(params[:hashid])
    @shop = Shop.find(JSON.load(@order.content)["shop"])
  end

  def update
  end

end
