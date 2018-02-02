class DrinksController < ApplicationController

  def index
    info = {}
    Drink.where(shop_id: params[:shop_id]).each do |drink|
      info[drink.id] = drink.price
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
    Drink.find(params.require(:drink)[:drink_id]).destroy
    redirect_back fallback_location: root_path
  end

end
