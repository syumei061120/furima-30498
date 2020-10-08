class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :item_find, only: [:show, :edit]

  def index
    @items = Item.all.order('created_at DESC')
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
  end

  def edit
    if @item.purchace.present? || current_user.id != @item.user_id
      redirect_to root_path
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end


  private

  def item_params
    params.require(:item).permit(:name, :image, :explanation, :category_id, :status_id, :postage_user_id, :state_id, :shipping_date_id, :price).merge(user_id: current_user.id)
  end

  def item_find
    @item = Item.find(params[:id])
  end
end
