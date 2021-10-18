class CardsController < ApplicationController
  def index
    @card_delivery = CardDelivery.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @card_delivery = CardDelivery.new(card_params)
    if @card_delivery.valid?
      pay_item
      @card_delivery.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def card_params
    params.require(:card_delivery).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.prise,
      card: card_params[:token],
      currency: 'jpy'
    )
  end
end
