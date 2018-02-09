class ShopsController < ApplicationController

  def index
    if params[:search]
      @shops = Shop.where(['name like ?', "%#{params[:search]}%"])
    else
      @shops = Shop.all
    end
  end

  def create
    @shop = Shop.new(params.require(:shop).permit(:name))
    @shop.custom = true
    if !@shop.save
      puts @shop.errors.full_messages.to_sentence
      redirect_to root_path
    end
    @order = Order.create(shop_id: @shop.id)
    redirect_to order_path(@order.hashid)
  end

  def update
    @shop = Shop.find(params[:id])
    @shop.menu = params.require(:shop)[:menu]
    @shop.save
    redirect_back fallback_location: root_path
  end

end
