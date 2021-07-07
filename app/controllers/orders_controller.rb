class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :move_to_index
  before_action :user_check, only: [:index,:create]
  before_action :purchased_check, only: [:index,:create]


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
    params.require(:order_destination).permit(:price, :zip, :shipping_area_id, :city, :block, :building,
                                              :phone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
  end

  def move_to_index
    unless user_signed_in?
      redirect_to root_path
    end
  end

  def user_check
    @item = Item.find(params[:item_id])
    if @item.user == current_user
      redirect_to root_path
    end
  end

  def purchased_check
    if @item.order.present?
      redirect_to root_path
    end
  end
end
