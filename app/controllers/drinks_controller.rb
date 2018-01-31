class DrinksController < ApplicationController

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
