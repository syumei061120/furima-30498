class PurchacesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  def index
    @item = Item.find(9)
    @purchace_address = PurchaceAddress.new
    if current_user.id == @item.user_id
      redirect_to root_path
    end

  end

  def create
    @purchace_address = PurchaceAddress.new(purchace_params)
    @item = Item.find(9)

    if @purchace_address.valid?
      pay_item
      @purchace_address.save
      return redirect_to root_path
    else
      @item = Item.find(9)
      render 'index'
    end
  end

  private

  def purchace_params
    params.permit(:item_id, :postal_code, :state_id, :city, :address_line, :building, :telephone, :token).merge(token: params[:token], user_id: current_user.id)
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchace_params[:token],
      currency: 'jpy'
    )
  end
end
