class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item,           except: [:index, :new, :create]
  before_action :move_to_index,      only:   [:edit, :destroy]

  def index
    @items = Item.all.includes(:user).order("created_at DESC")
  end 

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end 

  def show 
  end 

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit, status: :unprocessable_entity 
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(
      :image, :name, :description, :category_id, :status_id, :burden_id, :prefecture_id, :shipping_day_id, :price
    ).merge(user_id: current_user.id)
  end
  def set_item
    @item = Item.find(params[:id])
  end
  def move_to_index
    @item = Item.find(params[:id])
    if current_user.id != @item.user_id || @item.order.present?
      redirect_to action: :index
    end
  end
end