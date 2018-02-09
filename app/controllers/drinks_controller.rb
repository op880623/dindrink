class DrinksController < ApplicationController

  def index
    info = {}
    Order.find(params[:shop_id]).shop.drinks.each do |drink|
      info[drink.id] = {name: drink.name, price: drink.price}
    end
    render json: info
  end

  def create
    if Shop.find(params[:shop_id]).custom
      @drink = Drink.new(params.require(:drink).permit(:name, :price))
      @drink.shop_id = params[:shop_id]
      if !@drink.save
        puts @drink.errors.full_messages.to_sentence
      end
    end
    redirect_back fallback_location: root_path
  end

  def destroy
    @drink = Drink.find(params[:id])
    @drink.destroy if @drink.shop.custom
    redirect_back fallback_location: root_path
  end

end
