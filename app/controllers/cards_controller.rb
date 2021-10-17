class CardsController < ApplicationController
  
  def index
    @card_delivery = CardDelivery.new
    @item = Item.all

  end

  def create
    @card_delivery = CardDelivery.new(card_params)
    if @card_delivery.valid?
      @card_delivery.save
      redirect_to root_path
    else
    @item = Item.all
    render :index
    end
  end

  private

  def card_params
    params.require(:card_delivery).permit(:hoge, :post_code, :prefecture_id, :city, :address,:building_name,:phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
