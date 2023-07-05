class ItemsController < ApplicationController

  def index
    @items = Item.all
  end 

  def def new
    @item = Item.new
  end
end
