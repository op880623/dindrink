class ShopsController < ApplicationController

  def index
    @shops = Shop.all
  end

  def create
    @shop = Shop.new(params.require(:shop).permit(:name))
    if !@shop.save
      puts @shop.errors.full_messages.to_sentence
      redirect_to root_path
    end
    @order = Order.create(shop_id: @shop.id)
    redirect_to order_path(@order.hashid)
  end
end
