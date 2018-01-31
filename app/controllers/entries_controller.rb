class EntriesController < ApplicationController

  def create
    @entry = Entry.new(params.require(:entry).permit(:custumer, :drink_id, :quantity))
    @entry.order = Order.find(params[:order_id])
    @entry.save
    redirect_back fallback_location: root_path
  end

  def update
    @entry = Entry.find(params[:id])
  end

  def destroy
    Entry.find(params[:id]).destroy
    redirect_back fallback_location: root_path
  end

end
