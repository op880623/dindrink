class EntriesController < ApplicationController
  before_action :set_entry, only: [:update, :destroy]

  def create
    @entry = Entry.new(params.require(:entry).permit(:custumer, :drink_id, :quantity))
    @entry.order = Order.find(params[:order_id])
    @entry.save
    redirect_back fallback_location: root_path
  end

  def update
  end

  def destroy
    @entry.destroy
    redirect_back fallback_location: root_path
  end

  private

  def set_entry
    @entry = Entry.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_back fallback_location: root_path
  end

end