class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index

  def index
    @item = Item.find(params[:item_id])
  end 

  def new
  end

  def create
    @order = Order.create(order_params)
    Address.create(address_params)
    redirect_to root_path
  end

  private
  def order_params
    params.permit(:item_id).merge(user_id: current_user.id)
  end

  def address_params
    params.permit(:postal_code, :prefecture_id, :city, :block, :phone_number).merge(order_id: @order.id)
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end
end
