class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index
  def index
    @item = Item.find(params[:item_id])
  end 

  def new
  end

  def create
  end

  private
  def move_to_index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end
end
