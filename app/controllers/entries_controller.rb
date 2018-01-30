class EntriesController < ApplicationController

  def create
    @entry = Entry.new(params.require(:entry).permit(:custumer, :drink_id, :quantity))
    @entry.order = Order.find(params[:hash_id])
    if @entry.save
      redirect_back fallback_location: root_path
    else
      puts @entry.errors.full_messages.to_sentence
      redirect_back fallback_location: root_path
    end
  end

  def update
    @entry = Entry.find(params[:id])
  end

  def destroy
    Entry.find(params[:id]).destroy
    redirect_back fallback_location: root_path
  end

end
