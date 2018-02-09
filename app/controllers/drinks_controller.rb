class DrinksController < ApplicationController

  def index
    @shop = Shop.find(Order.find(params[:shop_id]).shop_id)
    info = {}
    @shop.drinks.each do |drink|
      info[drink.id] = {name: drink.name, price: drink.price}
    end
    render json: info
  end

  def create
    @drink = Drink.new(params.require(:drink).permit(:name, :price))
    @drink.shop_id = params[:shop_id]
    if !@drink.save
      puts @drink.errors.full_messages.to_sentence
    end
    redirect_back fallback_location: root_path
  end

  def destroy
    Drink.find(params[:id]).destroy
    redirect_back fallback_location: root_path
  end

end
