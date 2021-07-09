class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :user_check, only: [:index, :create]
  before_action :purchased_check, only: [:index, :create]

  def index
    @order_destination = OrderDestination.new
  end

  def new
  end

  def create
    @order_destination = OrderDestination.new(order_params)
    if @order_destination.valid?
      pay_item
      @order_destination.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_destination).permit(:zip, :shipping_area_id, :city, :block, :building,
                                              :phone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def user_check
    @item = Item.find(params[:item_id])
    redirect_to root_path if @item.user == current_user
  end

  def purchased_check
    redirect_to root_path if @item.order.present?
  end
end
