class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update]

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
    if  @item.user_id != current_user.id|| @item.cards.present?
    redirect_to action: :index 
    end
  end

  def update

    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    if item.user_id == current_user.id
      item.destroy
      redirect_to root_path
    else
      redirect_to items_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :text, :category_id, :status_id, :postage_id, :region_id, :day_id,
                                 :prise).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
