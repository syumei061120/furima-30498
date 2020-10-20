class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :item_find

  def index
    @purchase = Purchase.find_by(item_id: params[:item_id])
    @purchase_address = PurchaseAddress.new
    redirect_to root_path if current_user.id == @item.user_id || @purchase.present?
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_params
    params.permit(:item_id, :postal_code, :state_id, :city, :address_line, :building, :telephone, :token).merge(token: params[:token], user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def item_find
    @item = Item.find(params[:item_id])
  end
end
