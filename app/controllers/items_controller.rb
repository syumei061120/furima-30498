class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :item_find, only: [:show, :edit, :update, :destroy]
  before_action :search_item

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

  def edit
    redirect_to root_path if @item.purchace.present? || current_user.id != @item.user_id
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.delete
      redirect_to root_path
    else
      render :show
    end
  end

  def search
    @items = @p.result
  end

  def show
    @comment = Comment.new
    @comments = @item.comments

    if Item.where('id < ?', @item.id).maximum(:id) == nil
      @prevItem = Item.find(@item.id = params[:id])
    else
      @prevItem = Item.where('id < ?', @item.id).maximum(:id)
    end
    if Item.where('id > ?', @item.id).minimum(:id) == nil
      @nextItem = Item.find(@item.id=params[:id])
    else
      @nextItem = Item.where('id > ?', @item.id).minimum(:id)
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :status_id, :postage_user_id, :state_id, :shipping_date_id, :price, images: []).merge(user_id: current_user.id)
  end

  def item_find
    @item = Item.find(params[:id])
  end

  def search_item
    @p = Item.ransack(params[:q])
  end
end
