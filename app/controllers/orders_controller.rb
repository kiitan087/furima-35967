class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
  end

  def new
    @order_destination = OrderDestination.new
  end

  def create
    @order_destination = OrderDestination.new(order_params)
    if @order_destination.valid?
      @order_destination.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order_destination).permit(:zip, :shipping_area_id, :city, :block, :building, :phone_number, :user_id, :item_id).merge(user_id: current_user.id)
  end
end
