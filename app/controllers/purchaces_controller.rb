class PurchacesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :item_find

  def index
    @purchace = Purchace.find_by(item_id: params[:item_id])
    @purchace_address = PurchaceAddress.new
    redirect_to root_path if current_user.id == @item.user_id || @purchace.present?
  end

  def create
    @purchace_address = PurchaceAddress.new(purchace_params)
    if @purchace_address.valid?
      pay_item
      @purchace_address.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchace_params
    params.permit(:item_id, :postal_code, :state_id, :city, :address_line, :building, :telephone, :token).merge(token: params[:token], user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchace_params[:token],
      currency: 'jpy'
    )
  end
  
  def item_find
    @item = Item.find(params[:item_id])
  end
end
