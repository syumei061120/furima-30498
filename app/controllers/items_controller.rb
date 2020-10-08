class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
    @items = Item.all.order('created_at DESC')
    @purchaces = Purchace.select(:item_id)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    @purchace = Purchace.find_by(item_id: params[:id])
  end


  private

  def item_params
    params.require(:item).permit(:name, :image, :explanation, :category_id, :status_id, :postage_user_id, :state_id, :shipping_date_id, :price).merge(user_id: current_user.id)
  end
  
end
